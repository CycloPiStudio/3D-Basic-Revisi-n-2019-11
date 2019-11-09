extends Spatial

var preBala = preload("res://Ejecutable/Juego/Escenarios/Potenciadores/P.3_Cannon/Balika/balika.tscn")
var posPoseedorCannon
var rotPoseedorCannon
var potenciaDisparo = 5

#func _ready():
#	pass


func _process(_delta):
	
	posPoseedorCannon = get_parent().get_global_transform()
	rotPoseedorCannon = get_parent().get_rotation()

	
func Disparo():
	var bala = preBala.instance()
	get_parent().get_parent().add_child(bala) #instancia la bala a un nodo superior al cañon 
	bala.set_global_transform(posPoseedorCannon) # posiciona la bala en la posicion del cañon 
	bala.set_rotation(rotPoseedorCannon +Vector3(0,PI/2,0)) #  rota la bala segun el cañon
	bala.apply_impulse(Vector3(0,0,0),  (get_parent().player.get_global_transform()[3] + Vector3(0,0.5,0) - posPoseedorCannon[3])*potenciaDisparo) #impulsa la bala segun el cañon
