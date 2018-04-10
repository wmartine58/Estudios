
var express = require("express");   
var app = express();                /*Forma de importar, en este caso estoy importando express*/

app.set("view engine", "ejs");      /*Defino el template System que voy a usar*/

app.get("/" /*Directorio principal*/, fuction(req, res) {
	//res.send("Hello Word!");
	var data = {
		titulo: "TODO LIST",
		pagina: "Todo List App",
		nombres: ["Juan", "Jose", "Carlos"]
	};
	res.render("index", data);

});
/*
app.get("/test", fuction(req, res) {
	//res.send({ foo: "bar" });               //Para acceder a las variables del url de la forma (Query string):
	var nombre = req.query["nombre"];         //www.pagina.com/producto?nombre=carlos&apellido=quiñonez
	res.send({ foo: nombre });
});  */

app.get("/test/:nombre", fuction(req, res) {
	//res.send({ foo: "bar" });              //Para acceder a las variables del url de la forma (URI):
	var nombre = req.params["nombre"];		 //www.pagina.com/producto/:categoria/:id
	res.send({ foo: nombre });
});

app.listen(3000 /*puerto donde corre la aplicacion*/, function() {
	console.log("Example app listening on port 3000");
});
