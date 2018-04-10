var main = function() {
	var url = "http://api.flickr.com/services/feeds/photos_public.gne?" + "tags=paisajes&format=json&jsoncallback=?";
	//var url = "test.json";
	
	$.getJSON(url, function(respuesta) {
		respuesta.items.forEach(function(item) {
			var $img = $("<img>");
			$img.attr("src", item.media.m);
			$("main.photos").append($img);
			$img.fadeIn();
		});
	});
	console.log("practica");
}

$(document).ready(main);