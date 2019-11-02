extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var graf_vida

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	graf_vida = get_node("/root/partida/HUD/HUD1vidaNodo/Datos_comunes/Label_datos_comunes")
	graf_vida.set_text("Aquí pondré la vida actualizada")
	graf_vida.set_position(Vector2(815,60))
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	graf_vida.set_text("La vida: "+ str(Global.vida) + " con nodos")
	
#	pass
