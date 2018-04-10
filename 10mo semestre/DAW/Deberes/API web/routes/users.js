var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/new', function(req, res, next) {
  res.send('Crear un nuevo usuario');
});

module.exports = router;
