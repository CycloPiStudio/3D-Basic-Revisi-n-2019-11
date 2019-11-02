extends Spatial

export(NodePath) var PlayerPath  = "" #You must specify this in the inspector!
export(float) var MovementSpeed = 20
export(float) var Acceleration = 3
export(float) var MaxJump = 10
export(float) var MouseSensitivity = 5
export(float) var RotationLimit = 45
export(float) var MaxZoom = 0.5
export(float) var MinZoom = 1.5
export(float) var ZoomSpeed = 2

var Player
var InnerGimbal
var Direction = Vector3()
var Rotation = Vector2()
var gravity = -10
var Movement = Vector3()
var ZoomFactor = 1
var ActualZoom = 1
var Speed = Vector3()
var CurrentVerticalSpeed = Vector3()
var JumpAcceleration = 3
var IsAirborne = false

# var pal cambio gameover
var preGameOver = preload("res://Ejecutable/Menus/Game Over/GameOver.tscn").instance()
var Personaje1Muerto
var ang_vertical

onready var rutaPlayer = (Global.personaje.get_path())
onready var nombrePlayer = get_node(rutaPlayer).get_child(0).name

onready var SonidoDanno = get_node("/root/partida/PosicionSalida/personaje/AudioDanno")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player = get_node(PlayerPath)
	InnerGimbal =  $InnerGimbal
	pass

func _unhandled_input(event):
	
	if event is InputEventMouseMotion :
		Rotation = event.relative * MouseSensitivity
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_UP:
				ZoomFactor -= 0.05
			BUTTON_WHEEL_DOWN:
				ZoomFactor += 0.05
		ZoomFactor = clamp(ZoomFactor, MaxZoom, MinZoom)
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_ESCAPE:
				#get_tree().quit()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			KEY_W: #FORWARD
				Direction.z -= 1
				
			KEY_S: #BACKBAWRD
				Direction.z += 1
				
			KEY_A: #LEFT
				Direction.x -= 1
			KEY_D: #RIGHT
				Direction.x += 1
			KEY_SPACE:
				if not IsAirborne:
					CurrentVerticalSpeed = Vector3(0,MaxJump,0)
					IsAirborne = true

	if event is InputEventKey and not event.pressed:
		match event.scancode:
			KEY_W:
				Direction.z += 1
			KEY_S:
				Direction.z -= 1
			KEY_A:
				Direction.x += 1
			KEY_D:
				Direction.x -= 1

	Direction.z = clamp(Direction.z, -1,1)
	Direction.x = clamp(Direction.x, -1,1)
	


func _physics_process(delta):
	#Rotation
	Player.rotate_y(deg2rad(-Rotation.x)*delta*MouseSensitivity)
	InnerGimbal.rotate_x(deg2rad(-Rotation.y)*delta*MouseSensitivity)
	ang_vertical = deg2rad(-Rotation.y)*delta*MouseSensitivity
	InnerGimbal.rotation_degrees.x = clamp(InnerGimbal.rotation_degrees.x, -RotationLimit, RotationLimit)
	Rotation = Vector2()
	
	#Movement
	var MaxSpeed = MovementSpeed *Direction.normalized()
	Speed = Speed.linear_interpolate(MaxSpeed, delta * Acceleration)
	Movement = Player.transform.basis * (Speed)
	CurrentVerticalSpeed.y += gravity * delta * JumpAcceleration
	Movement += CurrentVerticalSpeed
	Player.move_and_slide(Movement,Vector3(0,1,0))
	
	if Player.is_on_floor() :
		CurrentVerticalSpeed.y = 0
		IsAirborne = false
	
	#Zoom
	ActualZoom = lerp(ActualZoom, ZoomFactor, delta * ZoomSpeed)
	InnerGimbal.set_scale(Vector3(ActualZoom,ActualZoom,ActualZoom))
	
	#Animación:
	if ((Movement.x <= -0.5 or Movement.x >= 0.5) and get_parent().get_node(str(nombrePlayer) + "/AnimationPlayer").is_playing() == false):
		#print("Speed", Speed)
		#print("m", Movement)
		#aquí animación andar lateral
		get_parent().get_node(str(nombrePlayer) + "/AnimationPlayer").play("caminar",-1,3)
	if ((Movement.z <= -0.5 or Movement.z >= 0.5) and get_parent().get_node(str(nombrePlayer) + "/AnimationPlayer").is_playing() == false):
		#aquí animación andar palante
		get_parent().get_node(str(nombrePlayer) + "/AnimationPlayer").play("caminar",-1,3)

		

#	else:
#		get_parent().get_node("Gooblin/AnimationPlayer").stop()
#
	
	#Colisión
	if Player.is_on_wall():
		Global.vida -= 1
		SonidoDanno.play()
		
		
		
	#la muerte de la cucuracha :) :) 
	if Global.vida < 0:
#		print("muere")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#		Esto no va bien se queda pillao el ratón
		get_node("/root/Global Menus").add_child(preGameOver)
		$".".queue_free()
		get_tree().get_root() # Access via scene main loop.
		Personaje1Muerto = get_parent()
		Personaje1Muerto.get_parent().get_parent().queue_free()
