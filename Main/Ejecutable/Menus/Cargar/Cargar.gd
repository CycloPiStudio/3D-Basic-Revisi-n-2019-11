extends Node

onready var botonGuardados = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Boton.tscn")
signal boton

func _ready():
	$Guardados/Cargar1.set_text(Global.nombre_guardado1)
	$Guardados/Cargar2.set_text(Global.nombre_guardado2)
	$Guardados/Cargar3.set_text(Global.nombre_guardado3)
	$Guardados/Cargar4.set_text(Global.nombre_guardado4)
	$Guardados.set_position(Vector2(get_viewport().size.x/4 , get_viewport().size.y/2))
	
	mostrarGuardados()
	pass 


func _on_LineEdit_text_changed(new_text):
	Global.nombre_guardado = new_text
	pass 


func _on_Cargar_pressed():
	Global.cargar(Global.nombre_guardado)
	get_parent().get_node("boton").play()
	pass # replace with function body
	
var partidasGuardadas = Directory.new()

func mostrarGuardados():
	partidasGuardadas.open("user://game_saves")
	listarGuardados()
	pass
	
	

func listarGuardados():	
	var Boton = botonGuardados.instance()
	partidasGuardadas.list_dir_begin()
	file_name = partidasGuardadas.get_next()
	while (file_name != ""):
		if !partidasGuardadas.current_is_dir():
			print("Found directory: " + file_name)
			pass
		else:
			print("Found file: " + file_name)
			pass
		file_name = partidasGuardadas.get_next()
		
var file_name
func _cargarPartida(file_name):
	Global.cargar(file_name)
	
#func mostrarGuardados():
#	var partidasGuardadas = Directory.new()
#	partidasGuardadas.open("user://game_saves")
#	$Label.set_text(str(partidasGuardadas.list_dir_begin()))
#	partidasGuardadas.list_dir_begin()
#	var file_name = partidasGuardadas.get_next()
#	while (file_name != ""):
#		if partidasGuardadas.current_is_dir():
#			print("Found directory: " + file_name)
#		else:
#			print("Found file: " + file_name)
#		file_name = partidasGuardadas.get_next()


func _on_Cargar1_pressed():
	Global.cargar(Global.nombre_guardado1)
	pass # replace with function body
func _on_Cargar2_pressed():
	Global.cargar(Global.nombre_guardado2)
	pass # replace with function body
func _on_Cargar3_pressed():
	Global.cargar(Global.nombre_guardado3)
	pass # replace with function body
func _on_Cargar4_pressed():
	Global.cargar(Global.nombre_guardado4)
	pass # replace with function body
