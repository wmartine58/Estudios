var i, textoMinusculas, textoPuro, textoInvertido;

function esPalindromo(cadena) {
	textoMinusculas = cadena.toLowerCase();
	textoMinusculas = textoMinusculas.split("");
	textoPuro = "";
	textoInvertido = "";
	textoInvertido.split("");
	for (i = 0; i < textoMinusculas.length; i++) {
		if (textoMinusculas[i] !=  " ")
			textoPuro  += textoMinusculas[i];
	}
	for (i = 0; i < textoPuro.length; i++) {
		textoInvertido[textoPuro.length - (i + 1)] = textoPuro[i];
	}
	if (textoInvertido == textoPuro)
		return true;
	else
		return false;
}