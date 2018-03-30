			printf("No existen procesos MEMORY para suspender\n");
	}

	if (1) { //preguntamos si los recursos del procesador estan bajos.
		if (cont_proc_act > 0) {			
			cont_proc_act--;
			printf("Posicion del proceso CPU: %d\n", cont_proc_act + 1);
			printf("Proceso CPU a suspender: %d\n", proc_activos[cont_proc_act]);
			kill(proc_activos[cont_proc_act], SIGSTOP);			
			proc_suspendidos[cont_proc_sus] = proc_activos[cont_proc_act];
			proc_activos[cont_proc_act] = 0;			
			cont_proc_sus++;
			printf("Proceso con ID: %d suspendido con exito\n", proc_suspendidos[cont_proc_sus - 1]);			
		}else
			printf("No existen procesos CPU para suspender\n");
	}
}

void reanudar_proceso() {
	if (1) { //preguntamos si los recursos de la memoria estan libres.
		if (cont_mem_sus > 0) {
			cont_mem_sus--;
			kill(mem_suspendidos[cont_mem_sus], SIGCONT);
			mem_activos[cont_mem_act] = mem_suspendidos[cont_mem_sus];
			mem_suspendidos[cont_mem_sus] = 0;
			printf("Proceso con ID: %d reanudado\n", mem_activos[cont_mem_act]);
			cont_mem_act++;
		}else
			printf("No existen procesos MEMORY para reanudar\n");
	}

	if (1) { //preguntamos si los recursos del procesador estan libres.	
		if (cont_proc_sus > 0) {
			cont_proc_sus--;
			kill(proc_suspendidos[cont_proc_sus], SIGCONT);
			proc_activos[cont_proc_act] = proc_suspendidos[cont_proc_sus];
			proc_suspendidos[cont_proc_sus] = 0;
			printf("Proceso con ID: %d reanudado\n", proc_activos[cont_proc_act]);
			cont_proc_act++;
		}else
			printf("No existen CPU para reanudar\n");
	}
}

void main() {
	while (1) {
		consumidor_memoria();
		consumidor_procesador();		
		//suspender_proceso();
		reanudar_proceso();

		printf("Valor procesador: %d\n", cont_proc_act);
		printf("Valor memoria: %d\n", cont_mem_act);
		printf("Valor actual del id consumidor del procesador: %d\n", proc_activos[cont_proc_act - 1]);
		printf("Valor actual del id consumidor de la memoria: %d\n", mem_activos[cont_mem_act - 1]);
		/*
		printf("Desea finalizar la ejecucion\n");
		scanf("%d", &ent);
		
		if (ent == 1) {
			return;
		}else {
			sleep(3);		
		}
		*/
	}	
}