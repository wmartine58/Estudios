#include <sys/shm.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define NUM_ORDENES 50

float *k_actual, *k_anterior;

/*
void registrar_valor_k(float k) {
	for(int i = 0; i < NUM_ORDENES; ++i) {
		if(Memoria[i] == 0) {			
			Memoria[i] = k;
			return;
		}
	}
}
*/

void registrar_valor_k(float k) {
	k_anterior[0] = k_actual[0];
	k_actual[0] = k;
}

void compartir_memoria() {
	float k;
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

	while(1) {
		printf("Ingrese el valor de K: \n");
		scanf("%f", &k);
		registrar_valor_k(k);
		printf("\n");
	}
}

int main() {
	compartir_memoria();
}