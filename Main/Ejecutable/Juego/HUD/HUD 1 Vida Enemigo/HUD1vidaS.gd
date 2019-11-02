extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var graf_vida
var bar_vida
var Enemigo


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	bar_vida =$TextureProgress
	Enemigo = get_parent().get_node("Enemigo")
	graf_vida = get_parent().get_node("HUD1vidaNodo/Datos_comunes/Label_datos_comunes")
	graf_vida.set_text("Aquí pondré la vida actualizada")
	graf_vida.set_position(Vector2(Enemigo.global_position.x-50 , Enemigo.global_position.y-60))
	bar_vida.set_position(Vector2(-30,-50))#Enemigo.global_position.x-50 , Enemigo.global_position.y-100))
	
	set_bar_vida()
#	print (Enemigo.vidaMalo)

	pass

func _process(delta):
	
#	print ("angulo : " + str((get_parent().motionM.angle())*180/3.14))
#	bar_vida.rect_rotation = get_parent().motionM.angle()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	graf_vida.set_text("La vida: "+ str(Enemigo.vidaMalo) + " con nodos")
#	if Enemigo.vidaMalo < 3
	bar_vida.value = Enemigo.vidaMalo
#	pass


func set_bar_vida():
	bar_vida.max_value = Enemigo.vidaMalo
	bar_vida.min_value = 0
	bar_vida.value = Enemigo.vidaMalo

