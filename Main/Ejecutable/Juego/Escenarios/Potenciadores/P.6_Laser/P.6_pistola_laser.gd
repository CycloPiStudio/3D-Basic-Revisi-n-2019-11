extends Spatial

var sonido_arma
var preBazoka = load("res://Ejecutable/Juego/Escenarios/Potenciadores/P.6_Laser/P.6_pistola_laser.tscn")

var Bazoka
var PoseedorBazoka
var Posicion
onready var tiempo_disparo = get_node("Tiempo_disparo")

onready var rutaPlayer = (Global.personaje.get_path())
onready var nombrePlayer = get_node(rutaPlayer).get_child(0).name
onready var NodoEsqueleto = get_node((str(Global.personaje.get_path()) + "/" + str(get_node(rutaPlayer).get_child(0).name) + "/rig/Skeleton"))

var posi
var hueso = 4

var preBala = preload("res://Ejecutable/Juego/Escenarios/Potenciadores/P.6_Laser/Laser_proyectil/Laser_proyectil.tscn")
var bala
var cogida = false
var posicion

#func _ready():
#	print(get_node("Audio_carga_arma").play())
#	pass

func _unhandled_input(event):
	if cogida == true and tiempo_disparo.is_stopped():
		if event is InputEventMouseButton:
			match event.button_index:
				BUTTON_LEFT:
					tiempo_disparo.start()
					bala = preBala.instance()
					get_parent().get_parent().add_child(bala)
					posicion = $".".get_global_transform()
#					posicion[3] = $".".get_global_transform()[3]+Vector3(1,1,1)
					bala.set_global_transform(posicion)
#					bala.apply_impulse($".".get_rotation(), bala.get_global_transform().basis[0]*50)
					get_node("Audio_disparo").play()
					
		pass

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		Bazoka = preBazoka.instance()
		posi = NodoEsqueleto.get_bone_pose(hueso)
		posi[3] = NodoEsqueleto.get_bone_pose(hueso)[3]+Vector3(-0.5,2,-.5)
		Bazoka.set_global_transform(posi)
		Bazoka.rotate_y(-1.56)
		NodoEsqueleto.add_child(Bazoka)
#		Bazoka.get_node("Area/CollisionShape")
		sonido_arma = get_node("Audio_carga_arma")
		$".".remove_child(sonido_arma)
		get_parent().add_child(sonido_arma)
		sonido_arma.play()
#		print("Hay que sacar cartel: coge arma")
		Bazoka.cogida = true
		Global.arma = 2
		queue_free()
		
	pass # replace with function body

func _on_Tiempo_disparo_timeout():
	tiempo_disparo.stop()
	pass # replace with function body