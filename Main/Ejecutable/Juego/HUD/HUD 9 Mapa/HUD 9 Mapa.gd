extends MarginContainer

var viewport = null
var viewport_sprite = null
#var modelo = null
var camaraMinimapa = null

func _ready():
	viewport = $"Viewport"
	viewport_sprite = $"ViewPortSprite"
	viewport_sprite.texture = viewport.get_texture()
	camaraMinimapa = $Viewport/Camera
#	$".".set_position(Vector2($"ViewPortSprite".texture.get_size().x , $"ViewPortSprite".texture.get_size().y))

#	modelo = $"HUD 3D/Viewport/modelo"
	pass

func _physics_process(_delta):
#	$"ViewPortSprite".texture.get_size().x
	miniMapaPlayer()
	
	
func miniMapaPlayer():
	var Player = $"/root/partida/PosicionSalida/personaje"
	
	var PosPlayer = camaraMinimapa.unproject_position(Player.get_transform().origin)
	$Player.set_position(PosPlayer)
	pass