extends KinematicBody

var vida = 10000.0

func _ready():
	Global.vida = vida

	pass

func _process(_delta):
	vida = Global.vida
#	print (vida)
	pass
