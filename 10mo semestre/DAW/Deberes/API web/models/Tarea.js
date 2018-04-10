var mongoose = require('mongoose');

var TareaSchema = new mongoose.Schema({
	descripcion: String,
	updated_at: { type: Date, default: Date.now() }
});

module.exports = mongoose.model('Tarea', TareaSchema);