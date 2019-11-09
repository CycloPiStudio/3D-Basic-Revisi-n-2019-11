extends Spatial

var datos_inventario = {
	Arma = "Vacio",
	Monedas = "Vacio",
	Vida = "Vacio",
	}

func _ready():
	var rutaInventario = Directory.new()
	if !rutaInventario.dir_exists("user://game_inventario"):
		rutaInventario.open("user://")
		rutaInventario.make_dir("user://game_inventario")
		
	inventario = File.new()
	if !inventario.file_exists("user://game_inventario/inventario_guardado.sav"):
		inventario.open("user://game_inventario/inventario_guardado.sav", File.WRITE)
		inventario.store_line(to_json(persistencia))
		inventario.close()
	else:
		guardadoPersistente.open("user://game_saves/guardado_persistenete.sav", File.READ)
		var datosPersistentes = persistencia
		if !guardadoPersistente.eof_reached():
			var dato_previsto = parse_json(guardadoPersistente.get_line())
			if dato_previsto != null:
				datosPersistentes = dato_previsto
		nombre_guardado1 = datosPersistentes.nombre_guardado1
		nombre_guardado2 = datosPersistentes.nombre_guardado2
		nombre_guardado3 = datosPersistentes.nombre_guardado3
		nombre_guardado4 = datosPersistentes.nombre_guardado4
		guardadoPersistente.close()
	pass

#func _process(delta):
#	pass

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		pass
