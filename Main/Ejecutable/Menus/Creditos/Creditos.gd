extends Node

#

func _ready():
	escrituraLabel()

func escrituraLabel(): 
	var sizeX = get_viewport().size.x
	var sizeY = get_viewport().size.y
	var file = File.new()
	file.open("res://Ejecutable/Menus/Creditos/Licencias/Licencias.gd", File.READ)
	$ScrollContainer/Creditos.set_text(str(file.get_as_text()))
	$ScrollContainer.set_size(Vector2(sizeX * 0.9, sizeY * 0.8))
	$ScrollContainer.set_position(Vector2(sizeX * 0.05 , sizeY * 0.15))

