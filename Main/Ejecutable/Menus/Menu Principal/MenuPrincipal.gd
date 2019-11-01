extends Node

# útiles para  Menú básico 1x1: Un menú de entrar y un juego (sin determinar: temporizador)
# Modificar - borrar para diferentes proyectos ###############
var Juego_tempo = preload("res://Ejecutable/Juego/Escenarios/Niveles/Nivel1/Nivel1.tscn").instance()
###############
var PreCreditos = load("res://Ejecutable/Menus/Creditos/Creditos.tscn")
var Creditos
#var Jugar = preload("res://Ejecutable/Menus/Select Personaje/SelectPersonaje.tscn").instance()
#var Cargar = preload("res://Ejecutable/Menus/Cargar/Cargar.tscn").instance()
#var Multiplayer = preload("res://Ejecutable/Menus/MultiPlayer/Menu muliplayer.tscn").instance()
#var Controles = preload("res://Ejecutable/Menus/Controles/controles.tscn").instance()

func _ready():
	$VBoxContainer.set_position(Vector2(get_viewport().size.x/4 , get_viewport().size.y/4))
	pass

func _on_Creditos_pressed():
#	get_node("/root/Global Menus").add_child(Creditos)
############# 	útiles para  Menú básico 1x1: ##############
#	get_node("/root/Global Menus").add_child(Juego_tempo)
	Creditos = PreCreditos.instance()
	get_node("/root/Global Menus").add_child(Creditos)
############################################################
	get_parent().get_node("boton").play()
#	queue_free()
	$".".queue_free()
#	print($".")
	pass 
#
func _on_Jugar_pressed():
#	get_node("/root/Global Menus").add_child(Jugar)
############# 	útiles para  Menú básico 1x1: ##############
	get_node("/root/Global Menus").add_child(Juego_tempo)
############################################################
	get_parent().get_node("boton").play()
	$".".queue_free()
	pass 
#
#func _on_Salir_pressed():
#	get_tree().quit()
#	get_parent().get_node("boton").play()
#	pass 
#
#func _on_Cargar_pressed():
#	get_node("/root/Global Menus").add_child(Cargar)
#	get_parent().get_node("boton").play()
#	$".".queue_free()
#	pass
#
#func _on_Multiplayer_pressed():
#	get_node("/root/Global Menus").add_child(Multiplayer)
#	get_parent().get_node("boton").play()
#	$".".queue_free()
#	pass # Replace with function body.
#
#func _on_Controles_pressed():
#	get_node("/root/Global Menus").add_child(Controles)
#	get_parent().get_node("boton").play()
#	$".".queue_free()
#	pass # Replace with function body.
