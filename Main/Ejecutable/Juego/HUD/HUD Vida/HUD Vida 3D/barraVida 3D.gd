extends Spatial

onready var barraVida = $BarraVida/BarraVida
var vida = 0.0
var vidaPadre = 0.0
var vidaMax = 0.0

func _ready():
	vidaMax = get_parent().vida 
	
	
	
	pass 
	
func _process(_delta):
	vidaPadre = get_parent().vida
#	print ("Nombre del padre: " + str(get_parent().name))
#	print ("Padre: " + str(vidaPadre))
#	print ("MAX: " + str(vidaMax))
	vida = float(vidaPadre) / float(vidaMax)
	barraVida.set_scale(Vector3(vida,1,1))


	pass
