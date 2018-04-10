function nuevoComentario() {
	var comentario, nuevoComentario;

	comentario = $('.comment-input input');
	if (comentario.val() != "") {
		nuevoComentario =  $("<p></p>").text(comentario.val());
		$(".comments").append(nuevoComentario);
		comentario.val(""));
	}
}

function leerEntrada(){
	$(".comment-input button").click(function() {
		nuevoComentario();
	})
	$(".comment-input input").keypress(function() {
		if (event.keyCode == 13) {
			nuevoComentario();
		}
	})
}

$(document).ready(leerEntrada());