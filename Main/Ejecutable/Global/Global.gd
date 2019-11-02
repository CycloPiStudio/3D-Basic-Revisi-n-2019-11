extends Node

var personaje = 0
var RutaPersonajeSelect = 0
var nivel = 0
var RutaNivelSelect = 0
var vida = 0
var puntos = 0
var arma = 0
var partida	

#
#func _process(delta):
##	print (RutaNivelSelect)
#	pass
func subirnivel():
	nivel += 1 
	print("A subido de nivel", nivel)
	

func _ready():
	print("Activo en el global ", personaje,RutaPersonajeSelect,nivel,nivel,RutaNivelSelect,vida, puntos , arma, partida)
#	print("Activo en el global variable RutaPersonajeSelect", RutaPersonajeSelect)
#	print("Activo en el global variable nivel", nivel)
#	print("Activo en el global RutaNivelSelectl", RutaNivelSelect)
#	print("Activo en el global vida", vida)
#	print("Activo en el global puntos", puntos)
#	print("Activo en el global arma", arma)
#	print("Activo en el global partida", partida)


##Partidas guardadas _______________________________
#var guardadoPersistente = null
#var nombre_guardado1 = "Vacío"
#var nombre_guardado2 = "Vacío"
#var nombre_guardado3 = "Vacío"
#var nombre_guardado4 = "Vacío"
#
#var persistencia = {
#nombre_guardado1 = "Vacío",
#nombre_guardado2 = "Vacío",
#nombre_guardado3 = "Vacío",
#nombre_guardado4 = "Vacío"
#}
#var datos_partida = {
#puntos = 0,
#arma = 0,
#nivel = 0,
#RutaNivelSelect = 0,
#vida = 0,
#RutaPersonajeSelect = 0
#}
#__________________________________________________
#
##Inventario__________________________________________
#var inventario
#var datos_inventario = {
#	Arma = "Vacio",
#	Monedas = "Vacio",
#	Vida = "Vacio",
#	}
##var inventarioPersistente = {
#	}
#___________________________________________________



	
#	crearArchivoGuardado()
	
	
	
#func crearArchivoGuardado():
#
#	var rutaGuardar = Directory.new()
#	if !rutaGuardar.dir_exists("user://game_saves"):
#		rutaGuardar.open("user://")
#		rutaGuardar.make_dir("user://game_saves")
#
#	guardadoPersistente = File.new()
#	if !guardadoPersistente.file_exists("user://game_saves/guardado_persistenete.sav"):
#		guardadoPersistente.open("user://game_saves/guardado_persistenete.sav", File.WRITE)
#		guardadoPersistente.store_line(to_json(persistencia))
#		guardadoPersistente.close()
#	else:
#		guardadoPersistente.open("user://game_saves/guardado_persistenete.sav", File.READ)
#		var datosPersistentes = persistencia
#		if !guardadoPersistente.eof_reached():
#			var dato_previsto = parse_json(guardadoPersistente.get_line())
#			if dato_previsto != null:
#				datosPersistentes = dato_previsto
#		nombre_guardado1 = datosPersistentes.nombre_guardado1
#		nombre_guardado2 = datosPersistentes.nombre_guardado2
#		nombre_guardado3 = datosPersistentes.nombre_guardado3
#		nombre_guardado4 = datosPersistentes.nombre_guardado4
#		guardadoPersistente.close()
#
#func crearArchivoInventario():
#	var rutaInventario = Directory.new()
#	if !rutaInventario.dir_exists("user://game_inventario"):
#		rutaInventario.open("user://")
#		rutaInventario.make_dir("user://game_inventario")
#
#	inventario = File.new()
#	if !inventario.file_exists("user://game_inventario/inventario_guardado.sav"):
#		inventario.open("user://game_inventario/inventario_guardado.sav", File.WRITE)
#		inventario.store_line(to_json(datos_inventario))
#		inventario.close()
#	else:
#		inventario.open("user://game_inventario/inventario_guardado.sav", File.READ)
#		var datosPersistentes = persistencia
#		if !guardadoPersistente.eof_reached():
#			var dato_previsto = parse_json(guardadoPersistente.get_line())
#			if dato_previsto != null:
#				datosPersistentes = dato_previsto
#		nombre_guardado1 = datosPersistentes.nombre_guardado1
#		nombre_guardado2 = datosPersistentes.nombre_guardado2
#		nombre_guardado3 = datosPersistentes.nombre_guardado3
#		nombre_guardado4 = datosPersistentes.nombre_guardado4
#		guardadoPersistente.close()
#	pass
#
#func guardar(nombre_guardado):
#	var save = File.new()
##	var sav = File.new()
#	save.open("user://game_saves/" + str(nombre_guardado) + ".sav", File.WRITE)
#
#	var datos_guardar = datos_partida
#	datos_guardar.puntos = puntos
#	datos_guardar.arma = arma
#	datos_guardar.nivel = nivel
#	datos_guardar.RutaNivelSelect = RutaNivelSelect
#	datos_guardar.vida = vida
#	datos_guardar.RutaPersonajeSelect = RutaPersonajeSelect
#
#	save.store_line(to_json(datos_guardar))
#	save.close()
#	print("guarda")
#	pass
#
#func cargar(nombre_guardado):
##	Crea el directorio sobre el que guardar
#	var cargar = File.new()
#	if !cargar.file_exists("user://game_saves/" + str(nombre_guardado) + ".sav"):
#		print ("No hay partidas guardadas")
#		return	
#	cargar.open("user://game_saves/" + str(nombre_guardado) + ".sav", File.READ)
#
##	Comprueba las variables a cargar y las carga
#	var datos_cargar = datos_partida
#	if !cargar.eof_reached():
#		var dato_previsto = parse_json(cargar.get_line())
#		if dato_previsto != null:
#			datos_cargar = dato_previsto
#	cargar.close()
#
#	puntos = datos_cargar.puntos 
#	arma = datos_cargar.arma
#	nivel = datos_cargar.nivel
#	RutaNivelSelect = datos_cargar.RutaNivelSelect
#	vida = datos_cargar.vida
#	RutaPersonajeSelect = datos_cargar.RutaPersonajeSelect
#
##	monta la partida cargada
#	cargarNivel(RutaNivelSelect)
#	cargarPlayer(RutaPersonajeSelect)
#	$"/root/Global Menus/Cargar".queue_free()
#
#	print ("cargar partida")
#
#func cargarPlayer(RutaPersonajeSelect):
#	personaje = load(RutaPersonajeSelect).instance()
#	personaje.set_name("personaje")
#	print ("carga player")
#
#func cargarNivel(RutaNivelSelect0):
#	partida = load(str(RutaNivelSelect0)).instance()
#	RutaNivelSelect0 = partida.get_name()
#	personaje = load(str(RutaPersonajeSelect)).instance()
#	personaje.set_name("personaje")
#	partida.set_name("partida")
#	partida.get_node("PosicionSalida").add_child(personaje)
#	get_parent().add_child(partida)
##	print (Global.personaje.get_path())
#	get_parent().get_node("Global Menus/Musica Menus/").stop()
#	pass
#
