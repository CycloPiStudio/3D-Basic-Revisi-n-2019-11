extends MarginContainer

onready var MenPrincipal = load("res://Ejecutable/Menus/Menu Principal/MenuPrincipal.tscn").instance()




func _on_Button_pressed():
	get_node("/root/Global Menus").add_child(MenPrincipal)
#	print(get_parent().get_parent().name)
	get_node("/root/Global Menus/boton").play()
	get_node("/root/partida").queue_free()
	get_tree().paused = false
#	get_parent().queue_free()
	
	
	pass # replace with function body


func _ready():
	$Pause.set_position(Vector2(get_viewport().size.x/40 , get_viewport().size.y/30))
#	$"Pause-PopUp/Continue".set_position(Vector2(get_viewport().size.x/2 , get_viewport().size.y/2))
	$"Pause-PopUp".set_position(Vector2(get_viewport().size.x/2 , get_viewport().size.y/2))
	pass

#func _process(delta):

#	pass

func _input(ev):
	if Input.is_key_pressed(KEY_P):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		_on_Pause_pressed()


func _on_Pause_pressed():
	get_tree().paused = true
	get_node("/root/Global Menus/boton").play()
	$"Pause-PopUp".show()
	$"Pause-PopUp".set_position(Vector2(get_viewport().size.x/2 , get_viewport().size.y/2))

	pass # replace with function body


func _on_Continue_pressed():
	get_tree().paused = false
	get_node("/root/Global Menus/boton").play()
	$"Pause-PopUp".hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # replace with function body
