extends Spatial

var likidao = false

var preVidaP1 = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Label.tscn").instance()
var VidaP1
var SumaVida = 300

var tiempoEntra = 20

var banderaVisible = false
var VeloNum =100
var contColor = 0.0
#var posicion
var posicionSalida = Vector2(700,0)
var posiPot = Vector3()
var posiPotTransform





func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	posicion = $".".get_position()
	pass

func _process(delta):
#	if  get_node("Scene Root/AnimationPlayer").is_playing() == false:
#		get_node("Scene Root/AnimationPlayer").play("default")
#	print(get_node("Scene Root2/AnimationPlayer").get_animation_list())
#	print(get_node("Scene Root2/AnimationPlayer").get_animation("default").resource_name)
	if banderaVisible:
		#esto pa mover el potenciador
#		posiPot.y = posiPot.y+1
#		posiPotTransform[3] = posiPot
#		print(posiPotTransform)
#		print($".".set_global_transform(posiPotTransform))
		#esto pa mover el numeriko
		VidaP1.set_position(Vector2(VidaP1.get_position().x , VidaP1.get_position().y+VeloNum*delta))
		get_node("Hub_vida/Sprite").set_position(VidaP1.get_position())
		contColor = contColor + delta
		# esto pal máximo de color llevar cuidao
		if contColor >= 1:
			contColor = 1
		VidaP1.set("custom_colors/font_color",Color(0.5,0,contColor))

	else:
		contColor = delta
		
	if OS.get_ticks_msec() - tiempoEntra  > 2000 and banderaVisible:
		$".".queue_free()
#		print("mato potenciador 1")
	
#	if likidao:
#		$".".queue_free()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		Global.vida += SumaVida
		get_node("Hub_vida/Sprite").set_position(posicionSalida)
		get_node("AudioPotenciador2").play()
		add_child(preVidaP1)
		tiempoEntra = OS.get_ticks_msec()
		VidaP1 =get_node("Label/Label_datos_comunes")
		VidaP1.set_position(posicionSalida)
		VidaP1.set_text("vida: "+ str(SumaVida) + " ")
		VidaP1.set("custom_colors/font_color",Color(1,0,0))
		
	#	print($".".set_position(Vector2(-300,-300))) #aqui aqui error aqui
		## error: como solo se "esconde" puedes entrar varia veces
		# error: solucion mover fuera de la pantalla
		$".".hide()
		#Coger poscion de potenciador pa moverlo después
		posiPot = $".".get_global_transform()[3]
		posiPotTransform = $".".get_global_transform()
		
		
		banderaVisible = true
		likidao = true
		pass # replace with function body
