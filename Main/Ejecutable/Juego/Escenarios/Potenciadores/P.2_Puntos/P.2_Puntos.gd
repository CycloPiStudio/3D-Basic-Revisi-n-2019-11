extends Spatial

var likidao = false

var prePuntosP1 = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var PuntosP1
var SumaPuntos = 300

var tiempoEntra = 20

var banderaVisible = false
var VeloNum =100
var contColor
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
	if  get_node("Scene Root/AnimationPlayer").is_playing() == false:
		get_node("Scene Root/AnimationPlayer").play("default")
#	print(get_node("Scene Root2/AnimationPlayer").get_animation_list())
#	print(get_node("Scene Root2/AnimationPlayer").get_animation("default").resource_name)
	if banderaVisible:
		#esto pa mover el potenciador
		posiPot.y = posiPot.y+1
		posiPotTransform[3] = posiPot
#		posiPotTransform
		$".".set_global_transform(posiPotTransform)
		#esto pa mover el numeriko
		PuntosP1.set_position(Vector2(PuntosP1.get_position().x , PuntosP1.get_position().y+VeloNum*delta))
		get_node("Hub_puntos/Sprite").set_position(PuntosP1.get_position())
		contColor = contColor + delta
		# esto pal máximo de color llevar cuidao
		if contColor >= 1:
			contColor = 1
		PuntosP1.set("custom_colors/font_color",Color(0.5,0,contColor))
	
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
		Global.puntos += SumaPuntos
		get_node("Hub_puntos/Sprite").set_position(posicionSalida)
		get_node("AudioPotenciador2").play()
		add_child(prePuntosP1)
		tiempoEntra = OS.get_ticks_msec()
		PuntosP1 =get_node("Datos_comunes/Label_datos_comunes")
		PuntosP1.set_position(posicionSalida)
		PuntosP1.set_text(""+ str(SumaPuntos) + " puntos")
		PuntosP1.set("custom_colors/font_color",Color(1,0,0))
		
	#	print($".".set_position(Vector2(-300,-300))) #aqui aqui error aqui
		## error: como solo se "esconde" puedes entrar varia veces
		# error: solucion mover fuera de la pantalla
	#	$".".hide()
		#Coger poscion de potenciador pa moverlo después
		posiPot = $".".get_global_transform()[3]
		posiPotTransform = $".".get_global_transform()
		
		
		banderaVisible = true
		likidao = true
		pass # replace with function body
