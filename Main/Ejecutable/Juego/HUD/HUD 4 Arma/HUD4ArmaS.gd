extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var graf_vida

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	graf_vida = get_node("/root/partida/HUD/HUD4armaNodo/Datos_comunes/Label_datos_comunes")
	#print(graf_vida) 
	graf_vida.set_text("Aquí pondré el arma actualizada")
	graf_vida.set_position(Vector2(815,180))
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if Global.arma == 0:
		graf_vida.set_text("Arma: "+ str(Global.arma)+", sin arma (nodos)")
	elif Global.arma == 2:
		graf_vida.set_text("Arma: "+ str(Global.arma)+", arma a (nodos)")

#	pass
