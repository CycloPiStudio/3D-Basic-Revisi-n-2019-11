extends Node2D
#
#var preMenu = load("res://Ejecutable/Menus/Menu Principal/MenuPrincipal.tscn")
var preMenu = load("res://Ejecutable/Menus/Select Niveles/SelectNiveles.tscn")
var Menu
var My_timer = 0
var segundos = 3

func _ready():
	get_node("Label").set_text(str(segundos-My_timer))
#
func _on_Timer_timeout():

	My_timer += 1
	get_node("Label").set_text(str(segundos-My_timer))
	if My_timer > segundos:
		Global.subirnivel()
		
		Menu =preMenu.instance()
		get_node("/root/Global Menus").add_child(Menu)
		
#		Global.nivel = Global.nivel+1
#		get_node("/root/Nodo_Dios/Music_menu").play()
		$".".queue_free()
	get_node("Timer").start()
	pass # Replace with function body.
