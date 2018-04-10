#include <conio.h>
#include <stdio.h>

void main() {
	srand(time(NULL));
}

void convertirString(int id, int num, char cd[]) {
	int temp;
	temp = temp + 97;
	switch() {
	}
}

void crearPanel(char cd[], char clave[]) {
	int i = 0, pos = rand()%2 + 2;
	if(pos == 1) {
		do {
			clave[0] = rand()%26 + 97;
		}while(clave[0] == cd[0]);
		do {
			clave[2] = rand()%26 + 97;
		}while(clave[2] == cd[0] || clave[2] == clave[0]);
		clave[1] = cd[0];
	}
	}else if(pos == 2) {
		do {
			clave[1] = rand()%26 + 97;
		}while(clave[1] == cd[0]);
		do {
			clave[2] = rand()%26 + 97;
		}while(clave[2] == cd[0] || clave[2] == clave[1]);
		clave[0] = cd[0];
	}else {
		do {
			clave[0] = rand()%26 + 97;
		}while(clave[0] == cd[0]);
		do {
			clave[1] = rand()%26 + 97;
		}while(clave[1] == cd[0] || clave[1] == clave[0]);
		clave[2] = cd[0];
	}
}

void menuClave(char id[]) {
	int i = 0;
	char clave[3], temp[];
	printf("\t\tBIENVENIDO");
	do{
		crearPanel(id[i], clave);
		printf("\t" + clave[0] + " " + clave[1] + " " + clave[2]);
		i++;
		crearPanel(id[i], clave);
		printf("\t" + clave[0] + " " + clave[1] + " " + clave[2] + "\n");
		i++;
	}while(i<4);
	i = 0;
	temp[i] = rand()%26 + 97;
	crearPanel(temp[i], clave);
	printf("\t" + clave[0] + " " + clave[1] + " " + clave[2]);
	i++;
	crearPanel(id[i], clave);
	printf("\t" + clave[0] + " " + clave[1] + " " + clave[2] + "\n");
	i++;
}