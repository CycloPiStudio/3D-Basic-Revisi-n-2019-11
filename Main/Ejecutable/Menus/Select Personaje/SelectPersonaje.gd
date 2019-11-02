extends Node

var SelecNiveles = preload("res://Ejecutable/Menus/Select Niveles/SelectNiveles.tscn").instance()
var viewport = null
var viewport_sprite = null
var modelo = null
const SPEED = 40

func _ready():
	$VBoxContainer.set_position(Vector2(get_viewport().size.x/4 , get_viewport().size.y/4))
	
	$"HUD 3D".set_position(Vector2(-100,-100))#-get_viewport().size.x/4 , -get_viewport().size.y/4))
	viewport = $"HUD 3D/Viewport"
	viewport_sprite = $"HUD 3D/ViewPortSprite"
	viewport_sprite.texture = viewport.get_texture()
	modelo = $"HUD 3D/Viewport/modelo"
	pass
	
func _process(delta):
	modelo.rotation_degrees.y += delta * SPEED
	pass
	
func PasarASelectecNivel():
	
	get_node("/root/Global Menus").add_child(SelecNiveles)
#	Global.personaje.get_path()
	$".".queue_free()
	

func _on_Player_1_pressed():
	get_parent().get_node("boton").play()
	Global.cargarPlayer("res://Ejecutable/Juego/Personajes/Personaje 1/Personaje1.tscn")
	Global.RutaPersonajeSelect = str("res://Ejecutable/Juego/Personajes/Personaje 1/Personaje1.tscn")
	PasarASelectecNivel()

	############# 	útiles para  Menú básico 1x1: ##############
#	get_node("/root/Global Menus").add_child(SelecNiveles)
#	$".".queue_free()
	############################################################
	pass 
func _on_Player_1_mouse_entered():
	$"HUD 3D/Viewport/modelo/Scene RootP1".show()
	pass 
func _on_Player_1_mouse_exited():
	$"HUD 3D/Viewport/modelo/Scene RootP1".hide()
	pass 


func _on_Player_2_pressed():
	get_parent().get_node("boton").play()
	Global.cargarPlayer("res://Ejecutable/Juego/Personajes/Personaje 2/Personaje2.tscn")
	Global.RutaPersonajeSelect = str("res://Ejecutable/Juego/Personajes/Personaje 2/Personaje2.tscn")
	PasarASelectecNivel()



#	############# 	útiles para  Menú básico 1x1: ##############
#	get_node("/root/Global Menus").add_child(SelecNiveles)
#	$".".queue_free()
	############################################################
	pass 
func _on_Player_2_mouse_entered():
	$"HUD 3D/Viewport/modelo/Scene RootP2".show()
	pass 
func _on_Player_2_mouse_exited():
	$"HUD 3D/Viewport/modelo/Scene RootP2".hide()
	pass 
