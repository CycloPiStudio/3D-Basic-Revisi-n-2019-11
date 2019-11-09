extends Node

var tope = 160
var contador = 0
onready var MenuPrincipal = preload("res://Ejecutable/Menus/Menu Principal/MenuPrincipal.tscn").instance()


func _ready():
	set_process(true)
	print($".".get_node("AudioGameOver").play())
	pass

func _process(delta):
	contador += 100*delta
	if contador > tope:
		print("fuera")
		
		get_node("/root/Global Menus").add_child(MenuPrincipal)
		get_parent().get_node("Musica Menus").play()
		$".".queue_free()
	pass
