var express = require('express');
var router = express.Router();

var mongoose = require('mongoose');
var Tarea = require('../models/Tarea');

var tareas = [
  { id: 1, descripcion: 'estudiar daw'},
  { id: 2, descripcion: 'hacer proyecto'}
];

router.get('/', function (req, res){
  Tarea.find({}, function(err, resp){
  	if(err){
  		res.send({ mensaje: "Error"});
  		return;
  	}
  	res.send(resp);
  });
});

router.get('/:id', function (req, res){
  var id = req.params['id'];
  for (var i = 0; i < tareas.length; i++){
    var t = tareas[i];
    if (t.id == id){
      res.send(t);
      return;
    }
  }
  res.send({});
});

router.post('/', function(req, res){     //¿Que diferencia hay entre '/' con '/:id'?
  Tarea.create(req.body, function(err, post){
  	if(err){
  		res.send({ mensaje: "Hubo error" });     //¿Que está pasando en el cuerpo del método?
  		return;
  	}
  	res.send({ mensaje: "Tarea creada" });
  });
});

router.put('/:id', function(req, res){
  var id = req.params['id'];
  for (var i = 0; i < tareas.length; i++){
    var t = tareas[i];
    if (t.id == id){
      var descripcion = req.body['descripcion'];
      tareas[i].descripcion = descripcion;
      res.send({ mensaje: 'Tarea actualizada' });
      return;
    }
  }
  res.send({ mensaje: 'Tarea no encontrada' });
});

router.delete('/:id', function(req, res){
  var id = req.params['id'];
  for (var i = 0; i < tareas.length; i++){
    var t = tareas[i];
    if (t.id == id){
      tareas.splice(i, 1);
      res.send({ mensaje: 'Tarea borrada' });
      return;
    }
  }
  res.send({ mensaje: 'Tarea no encontrada' });
});

module.exports = router;         //¿Que esta sucediendo?
