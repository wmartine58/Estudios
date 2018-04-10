var express = require('express');           //Este se refiere a que uso el recurso en mi sistema, mi computador
var app = express();

//cuando uso el metodo use() me refiero a la url del navegador

app.set("view engine", "ejs");  //Especifico que template voy a usar, en este caso ejs

app.get('/', function (req, res) {
  //res.send('¡Hola mundo!');
  var data = {
	  titulo: "Aplicacion de tareas",
	  nombres:["Juan", "Carlos", "Jose"]
  };
  res.render("index", data);
});

tareas = [
	{id: 35, descripcion: "Estudiar DAW"},
	{id: 36, descripcion: "Hacer el proyecto de DAW"},
];

app.get("/tareas", function(req, res) {    //Devolvera todas las tareas en esta localidad tareas que se crear para contener el recurso que se especifico en el res
//	res.send(tareas);   //se interpreta como si fuera un json, el send trabaja con json por defecto, pero si hay formas de setearlo a otro estandar de comunicacion como xml, etc.
	res.json(tareas);
});

app.get("/tareas/:id", function(req, res) {   //El parametro :id del get debe ser igual al del corchete de req.params
	var id = req.params["id"];	
	for (var i = 0; i < tareas.length; i++) {
		var t = tareas[i];		
		if (t.id == id) {
			res.send(t);
			return;    //Se pone return porque de no ser asi, esto se continua ejecutando y se envian dos respuestas
					   //una del send del if y otra del send del final
		}
	}	
	res.send({});
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
