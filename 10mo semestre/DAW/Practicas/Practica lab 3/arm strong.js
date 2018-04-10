import java.io.*;
import java.util.*;

var numero, i, j, cifras, total, continuar, temp;

i = 10;
cifras = 1;
continuar = true;

numero = parseInt(prompt('Ingrese un numero: ', ''));

while (continuar) {
	if (numero === 0) {
		cifras = 1;
		continuar = false;
	}else if (numero%i !== numero) {
		i = i*10;
		cifras++;
	}else 
		continuar = false;
}

total = 0;
j = 0;

for (i = 1; j<cifras;  i = i*10) {	
	temp = parseInt(numero/i);
	total = total + Math.pow(temp%10, 3);
	j++;
}

if (numero === total)
	console.log('El numero es arm strong');
else
	console.log('El numero no es arm strong');