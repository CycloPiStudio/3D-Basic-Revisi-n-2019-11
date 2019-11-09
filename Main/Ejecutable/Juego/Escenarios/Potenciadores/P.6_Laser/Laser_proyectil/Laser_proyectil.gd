extends KinematicBody

var preNoMensa = preload("res://Ejecutable/Juego/HUD/HUD 8 Mensaje/Hud_mensaje_info.tscn")
var NoMensa 
var padreBala

onready var tiempo_escala = get_node("Tiemposcala")
var contador = 0
var posicion

func _ready():
	print($".".get_name())
#	$".".rotate_y(1.56)
	$".".set_scale(Vector3(1,1,1))
	tiempo_escala.start()
	
	pass

#func _process(delta):
#	pass


func _on_VisibilityNotifier_screen_exited():
	queue_free()
	pass # replace with function body

func _on_Timer_timeout():
	queue_free()
	pass # replace with function body

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		# instancia nodo mensaje
		NoMensa = preNoMensa.instance()
		get_parent().add_child(NoMensa)
		# poner texto del mensje y la posicion: + bajo mas centrado
		NoMensa.mostra_mensa("Impacto de: " + str(get_name()),2,100)

		queue_free()
	pass # replace with function body

func _on_Tiemposcala_timeout():
	$".".set_scale(Vector3(1,1,-(1+(contador))))
	posicion = get_transform()
	print(get_transform())
	contador += 1
	print("llego")
	print(contador)
	pass # replace with function body
