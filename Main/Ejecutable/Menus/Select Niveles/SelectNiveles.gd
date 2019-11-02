extends Node

## Modificar - borrar para diferentes proyectos ###############
var Juego_tempo = preload("res://Ejecutable/Juego/Escenarios/Niveles/Nivel1/Nivel1.tscn").instance()
###############

var partida 
#
func _ready():
	$VBoxContainer.set_position(Vector2(get_viewport().size.x/4 , get_viewport().size.y/4))
	if Global.nivel == 0:
#		print(get_node("VBoxContainer/Nivel2").get_global_transform()[2])
		get_node("VBoxContainer/Nivel2").hide()
		get_node("VBoxContainer/Nivel3").hide()
		get_node("VBoxContainer/Nivel4").hide()

	
#	print(
	if Global.nivel == 1:
		get_node("VBoxContainer/Nivel3").hide()
		get_node("VBoxContainer/Nivel4").hide()

	if Global.nivel == 2:
		get_node("VBoxContainer/Nivel4").hide()

	if Global.nivel == 3:
		pass
#
#func _process(delta):
##	print (Global.personajeSelect)
#
#	pass
#
func _load_scene(nivel):
	Global.RutaNivelSelect = nivel
	partida = load(nivel).instance()
#	Global.nivel = partida.get_name()
	Global.personaje = load(Global.RutaPersonajeSelect).instance()
	Global.personaje.set_name("personaje")
	partida.set_name("partida")
	partida.get_node("PosicionSalida").add_child(Global.personaje)
	get_parent().get_parent().add_child(partida)
#	print (Global.personaje.get_path())
	get_parent().get_node("Musica Menus").stop()
	$".".queue_free()
#
#
#
func _on_Nivel1_pressed():
#	_load_scene("res://Ejecutable/Juego/Escenarios/Niveles/Nivel2/nivel2.tscn")
	get_parent().get_node("boton").play()
	############# 	útiles para  Menú básico 1x1: ##############
	get_node("/root/Global Menus").add_child(Juego_tempo)
	$".".queue_free()
	############# ############# 
	pass
#
func _on_Nivel2_pressed():
	_load_scene("res://Ejecutable/Juego/Escenarios/Niveles/Nivel2/Nivel2.tscn")
	get_parent().get_node("boton").play()
	############# 	útiles para  Menú básico 1x1: ##############
#	get_node("/root/Global Menus").add_child(Juego_tempo)
#	$".".queue_free()
	############# ############# 
#	pass # replace with function body
#
func _on_Nivel3_pressed():
#	_load_scene("res://Ejecutable/Juego/Escenarios/Niveles/Nivel3/nivel3.tscn")
	get_parent().get_node("boton").play()
	############# 	útiles para  Menú básico 1x1: ##############
	get_node("/root/Global Menus").add_child(Juego_tempo)
	$".".queue_free()
	############# ############# 
#	pass # replace with function body
#
func _on_Nivel4_pressed():
#	_load_scene("res://Ejecutable/Juego/Escenarios/Niveles/Nivel4/nivel4.tscn")
	get_parent().get_node("boton").play()
############# 	útiles para  Menú básico 1x1: ##############
	get_node("/root/Global Menus").add_child(Juego_tempo)
	$".".queue_free()
	############# #############
#	pass # replace with function body
