#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>

#define PARES 8
#define T_ACCION 5
#define T_LIMITE 30
#define T_ADAPTACION 40
#define NUM_ORDENES 50
#define K_MIN 0.5
#define K_MAX 1.5

struct datos {
	int posicion;
	float variacion;
};
struct datos lista_datos[PARES];
time_t t_inicial;
int ordenes_vigentes, movimientos;
int posiciones_barras[PARES];             //Registro de las posiciones de cada barra
int direcciones_barras[PARES];            //Registro de las direcciones de cada barra
int estados_barras[PARES];		          //Registro de los estados de cada barra, 1 moviendose y 0 estatica
float *k_actual, *k_anterior;
pthread_t lista_hilos[PARES];

void doSignal(int semid, int numSem);
void doWait(int semid, int numSem);
void initSem(int semid, int numSem, int valor);
void compartir_memoria();
void inicializar_datos();
int numero_movimientos();
int variacion_fuera_rango();
int barra_candidata(float variacion);
void resetear_datos();
void* mover_barra();
void iniciar_movimientos();
void mostrar_resultados();
void comprobar_estado_reactor();

void doSignal(int semid, int numSem) {
    struct sembuf sops; //Signal
    sops.sem_num = numSem;
    sops.sem_op = 1;
    sops.sem_flg = 0;
 
    if (semop(semid, &sops, 1) == -1) {
        perror(NULL);
        printf("Error al hacer Signal\n");
    }
}
 
void doWait(int semid, int numSem) {
    struct sembuf sops;
    sops.sem_num = numSem; /* Sobre el primero, ... */
    sops.sem_op = -1; /* ... un wait (resto 1) */
    sops.sem_flg = 0;
 
    if (semop(semid, &sops, 1) == -1) {
        perror(NULL);
        printf("Error al hacer el Wait\n");
    }
}
 
void initSem(int semid, int numSem, int valor) { //iniciar un semaforo
  
    if (semctl(semid, numSem, SETVAL, valor) < 0) {        
    perror(NULL);
        printf("Error iniciando semaforo\n");
    }
}

void compartir_memoria() {
	key_t clave_actual, clave_anterior;
	int id_Memoria_actual, id_Memoria_anterior;
	k_actual = NULL;
	k_anterior = NULL;	

	clave_actual = ftok("/bin/ls", 30);

	if (clave_actual == -1)
		exit(0);
	 
	id_Memoria_actual = shmget(clave_actual, sizeof(int)*100, 0777 | IPC_CREAT);

	if (id_Memoria_actual == -1)
		exit (0);

	k_actual = (float*)shmat(id_Memoria_actual, (char *)0, 0);

	clave_anterior = ftok("/bin/ls", 35);

	if (clave_anterior == -1)
		exit(0);
	 
	id_Memoria_anterior = shmget(clave_anterior, sizeof(int)*100, 0777 | IPC_CREAT);

	if (id_Memoria_anterior == -1)
		exit (0);

	k_anterior = (float*)shmat(id_Memoria_anterior, (char *)0, 0);
}

void inicializar_datos() {
	int i;
	struct datos d;
	k_actual[0] = 1, k_anterior[0] = 1;
	t_inicial = time(NULL);

	for (i = 0; i < PARES; ++i) {
		posiciones_barras[i] = 0;
	}

	for (i = 0; i < PARES; ++i) {
		direcciones_barras[i] = 1;
	}

	for (i = 0; i < PARES; ++i) {
		estados_barras[i] = 0;
	}

	for (i = 0; i < NUM_ORDENES; ++i) {
		d = lista_datos[i];
		d.posicion = -1;
		d.variacion = -1;
	}
}

int numero_movimientos() {
	int contador = 0;
	float variacion_k = k_actual[0] - 1;

	if(variacion_k < 0.01)
		variacion_k = (float)(variacion_k*-1);

	while(variacion_k < -0.01 || variacion_k > 0.01) {
		variacion_k = variacion_k - 0.1;
		contador++;
	}

	return contador;
}
/*
int variacion_fuera_rango() {
	float variacion_k = k_actual[0] - 1;

	if(variacion_k < -0.000001 || variacion_k > 0.000001)
		return 1;
	else
		return 0;
}
*/

int barra_candidata(float variacion) {
	int i, ultima_posicion;

	if(variacion > 0) {
		ultima_posicion = -30;

		for(i = 0; i < PARES; ++i) {
			if(posiciones_barras[i] > ultima_posicion && estados_barras[i] == 0)
				ultima_posicion = posiciones_barras[i];
		}

		for(i = 0; i < PARES; ++i) {
			if(posiciones_barras[i] == ultima_posicion && estados_barras[i] == 0 && ultima_posicion != -30)
				return i;
		}
	}else{
		ultima_posicion = 30;

		for(i = 0; i < PARES; ++i) {
			if(posiciones_barras[i] < ultima_posicion && estados_barras[i] == 0)
				ultima_posicion = posiciones_barras[i];
		}

		for(i = 0; i < PARES; ++i) {
			if(posiciones_barras[i] == ultima_posicion && estados_barras[i] == 0 && ultima_posicion != 30)
				return i;
		}	
	}

	return -1;
}

void resetear_datos() {
	for(int i = 0; i < PARES; ++i) {
		lista_datos[i].posicion = -1;
		lista_datos[i].variacion = -1;
	}
}

/*
void* mover_barra(void* arg) {	
	struct datos d;
	d = *(struct datos*)arg;
	int pos_barra = d.posicion, semaforo;	
	float k = d.variacion;

    if((semaforo=semget(IPC_PRIVATE,1,IPC_CREAT | 0700))<0) {
        perror(NULL);
        printf("Semaforo: semget");
    }

    initSem(semaforo, 0, 1);

	if(k > 0) {
		if(posiciones_barras[pos_barra] == -30);
		else {
			if(direcciones_barras[pos_barra] == 1) {
				sleep(T_ACCION);
				direcciones_barras[pos_barra] = 0;
			}

			sleep(T_ACCION);
			posiciones_barras[pos_barra] = posiciones_barras[pos_barra] - 10;			
			estados_barras[pos_barra] = 0;
			doWait(semaforo, 0);						
			k_actual[0] = k_actual[0] - 0.1;
			doSignal(semaforo, 0);
		}
	}else {
		if(posiciones_barras[pos_barra] == 30);
		else {
			if(direcciones_barras[pos_barra] == 0) {
				sleep(T_ACCION);
				direcciones_barras[pos_barra] = 1;
			}

			sleep(T_ACCION);			
			posiciones_barras[pos_barra] = posiciones_barras[pos_barra] + 10;
			estados_barras[pos_barra] = 0;
			doWait(semaforo, 0);
			k_actual[0] = k_actual[0] + 0.1;
			doSignal(semaforo, 0);
		}		
	}
}
*/

int variacion_nula() {
	float variacion_k = k_actual[0] - 1;

	if(variacion_k < -0.000001 || variacion_k > 0.000001)
		return 1;
	else
		return 0;
}

int tengo_prioridad(int posicion) {
	for (int i = 0; i < PARES; ++i) {
		if(posicion > i) {
			if(estados_barras[i] == 0 && (posiciones_barras[i] == -30 && (k_actual[0] - 1 > 0.00001)) 
				&& (posiciones_barras[i] == 30 && (k_actual[0] - 1 < 0.00001)))
				return 0;
		}
	}

	return 1;
}

void comprobar_estado_reactor() {
	clock_t t_actual = time(NULL);

	if(difftime(t_actual, t_inicial) >= T_LIMITE) {
		if(k_actual[0] >= K_MIN && k_actual[0] <= K_MAX);
		else {
			if(k_actual[0] < K_MIN) {
				printf("Reacccion en estado subcritico, el sistema procedera a suspenderse\n");
				exit(0);
			}

			if(k_actual[0] > K_MAX) {
				printf("Reacccion en estado supercritico, TODOS VAMOS A MORIR!!!!!\n");
				exit(0);					
			}
		}
	}
}

void mostrar_resultados() {
	printf("Nuevo valor de k: %f\n", k_actual[0]);	
	printf("Valor de la variacion de k: %f\n", k_actual[0] - k_anterior[0]);
	printf("Posiciones de las barras:\n[%i, %i, %i, %i, %i, %i, %i, %i]\n", posiciones_barras[0], posiciones_barras[1], 
		posiciones_barras[2], posiciones_barras[3], posiciones_barras[4], posiciones_barras[5], posiciones_barras[6], 
		posiciones_barras[7]);
	printf("[%i, %i, %i, %i, %i, %i, %i, %i]\n", posiciones_barras[0], posiciones_barras[1], 
		posiciones_barras[2], posiciones_barras[3], posiciones_barras[4], posiciones_barras[5], posiciones_barras[6], 
		posiciones_barras[7]);

	if(k_actual[0] >= -0.00001 && k_actual[0] <= 0.00001)
		printf("Reacccion en estado critico\n\n\n");
	else if(k_actual[0] < K_MIN)
		printf("Reacccion en estado subcritico\n\n\n");
	else
		printf("Reacccion en estado supercritico\n\n\n");
}

void* mover_barra(void* arg) {	
	struct datos d;
	d = *(struct datos*)arg;
	int pos_barra = d.posicion, semaforo;	
	float k;

    if((semaforo = semget(IPC_PRIVATE, 1, IPC_CREAT | 0700)) < 0) {
        perror(NULL);
        printf("Semaforo: semget");
    }

    initSem(semaforo, 0, 1);

    while(1) {    	
    	k = k_actual[0] - 1;

    	if(k_actual[0] >= K_MIN && k_actual[0] <= K_MAX)
			t_inicial = time(NULL);

		if(variacion_nula()) {
			if(k > 0) {
				if(posiciones_barras[pos_barra] == -30);
				else {
					doWait(semaforo, 0);

					if(tengo_prioridad(pos_barra) && variacion_nula()) {			
						k_actual[0] = k_actual[0] - 0.1;
						estados_barras[pos_barra] = 1;
						doSignal(semaforo, 0);

						if(direcciones_barras[pos_barra] == 1) {
							sleep(T_ACCION);
							direcciones_barras[pos_barra] = 0;
						}

						sleep(T_ACCION);
						posiciones_barras[pos_barra] = posiciones_barras[pos_barra] - 10;			
						estados_barras[pos_barra] = 0;										
					}else
						doSignal(semaforo, 0);
				}
			}else {
				if(posiciones_barras[pos_barra] == 30);
				else {				
					doWait(semaforo, 0);

					if(tengo_prioridad(pos_barra) && variacion_nula()) {				
						k_actual[0] = k_actual[0] + 0.1;
						estados_barras[pos_barra] = 1;
						doSignal(semaforo, 0);				

						if(direcciones_barras[pos_barra] == 0) {
							sleep(T_ACCION);
							direcciones_barras[pos_barra] = 1;
						}

						sleep(T_ACCION);			
						posiciones_barras[pos_barra] = posiciones_barras[pos_barra] + 10;
						estados_barras[pos_barra] = 0;					
					}else
						doSignal(semaforo, 0);
				}
			}
			
			if(pos_barra == 0) {
				comprobar_estado_reactor();
				mostrar_resultados();
			}			
		}
	}
    
}

void iniciar_movimientos() {
	for(int i = 0; i < PARES; ++i) {
		if(lista_datos[i].posicion != -1 && lista_datos[i].variacion != -1)
			pthread_join(lista_hilos[i], NULL);
	}

	resetear_datos();
}

int main(int argc, char* argv[]) {	
	compartir_memoria();
	inicializar_datos();			

	for(int i = 0; i < PARES; ++i) {
		lista_datos[i].posicion = i;							
		pthread_create(&lista_hilos[i], NULL, mover_barra, (void*)&lista_datos[i]);
	}

	iniciar_movimientos();
				
}

/*
int main(int argc, char* argv[]) {	
	int i, barra, movimientos;

	compartir_memoria();
	inicializar_datos();

	while(1) {
		if(k_actual[0] >= K_MIN && k_actual[0] <= K_MAX)
			t_inicial = time(NULL);
		
		if(variacion_fuera_rango())
			movimientos = numero_movimientos();

		while(movimientos > 0) {
			if(k_actual[0] >= K_MIN && k_actual[0] <= K_MAX)
				t_inicial = time(NULL);

			comprobar_estado_reactor();

			for(i = 0; i < PARES; ++i) {
				barra = barra_candidata(k_actual[0] - 1);

				if((barra == i) && movimientos > 0) {
					lista_datos[barra].posicion = barra;
					lista_datos[barra].variacion = k_actual[0] - 1;								
					pthread_create(&lista_hilos[barra], NULL, mover_barra, (void*)&lista_datos[barra]);
					estados_barras[i] = 1;
					movimientos--;
				}
			}

			iniciar_movimientos();

			if (barra != -1)
				mostrar_resultados();
		}		
	}
}
*/




