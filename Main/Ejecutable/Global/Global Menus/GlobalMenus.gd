extends Node

var MenuPrin = preload("res://Ejecutable/Menus/Menu Principal/MenuPrincipal.tscn")
var MenuPrincipal

func _ready():
	MenuPrincipal = MenuPrin.instance()
	get_node("/root/Global Menus").add_child(MenuPrincipal)
	$"Musica Menus".play()
	pass 