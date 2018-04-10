var i, cont;

function verificarValorCadena(arreglo, cadena, numero) {
	cont = 0;
	for (i = 0; i < arreglo.length; i++) {
		if (arreglo[i] === cadena)
			cont++;
	}
	if (cont === numero)
		return true;
	else
		return false;
}