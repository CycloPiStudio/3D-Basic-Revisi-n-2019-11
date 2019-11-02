extends MarginContainer

onready var label = $TextureRect/HBoxContainer/Puntos

func _ready():
	pass

func _process(delta):

	label.set_text(str(Global.puntos))
	
#	pass
