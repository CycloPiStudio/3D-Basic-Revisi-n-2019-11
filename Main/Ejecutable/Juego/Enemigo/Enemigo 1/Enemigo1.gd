extends KinematicBody


onready var player = get_node("/root/partida/PosicionSalida/personaje")
var posicion
var posPlayer 
var vida = 500

	
func _process(delta):
	posicion = get_global_transform()[3]
	posPlayer = player.get_global_transform()[3]
	var direccion = posPlayer - posicion
	var objetivoXZ = posPlayer - Vector3(0,posPlayer[1],0)
		
	#Mueve al nodo a la posicion del Player
#	$".".move_and_slide( direccion, Vector3( 0, 0, 0 )) #, 0.05, 4, 0.785398 )
	#Gira al nodo para mirar al Player
#	$".".look_at( objetivoXZ, Vector3(0,1,0))

	$".".look_at_from_position(posicion, objetivoXZ, Vector3(0,1,0))
#	print (objetivoXZ)
		
	var collision = move_and_collide(direccion)
#	print (collision)

	if collision:
		if collision.get_collider().is_in_group("Player"):
#			print (Global.vida)
			Global.vida -= 10
		
		if collision.get_collider().name == "Bala":
#			print (vida)
			vida -= 10
	if vida <= 0:
		queue_free()
		
