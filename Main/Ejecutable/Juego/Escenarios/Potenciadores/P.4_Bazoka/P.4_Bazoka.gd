extends Spatial

var sonido_arma
var preBazoka = load("res://Ejecutable/Juego/Escenarios/Potenciadores/P.4_Bazoka/P.4_Bazoka.tscn")

var Bazoka
#var PoseedorBazoka
#var Posicion

onready var rutaPlayer = (Global.personaje.get_path())
#onready var nombrePlayer = get_node(rutaPlayer).get_child(0).name
onready var NodoEsqueleto = get_node((str(Global.personaje.get_path()) + "/" + str(get_node(rutaPlayer).get_child(0).name) + "/rig/Skeleton"))

var posi
var hueso = 4

var preBala = preload("res://Ejecutable/Juego/Escenarios/Potenciadores/P.3_Cannon/Balika/balika.tscn")
var bala
var cogida = false

#func _ready():
#	print(get_node("Audio_carga_arma").play())
#	pass

func _process(_delta):
	
	$".".rotate_x(-get_node("/root/partida/PosicionSalida/personaje/Controller").ang_vertical)

func _unhandled_input(event):
	if cogida == true:
		if event is InputEventMouseButton:
			match event.button_index:
				BUTTON_LEFT:
					bala = preBala.instance()
					get_parent().get_parent().add_child(bala)
					bala.set_global_transform($".".get_global_transform())
					bala.apply_impulse($".".get_rotation(), bala.get_global_transform().basis[0]*50)
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
		Global.arma = 1
		queue_free()
		
	pass # replace with function body
