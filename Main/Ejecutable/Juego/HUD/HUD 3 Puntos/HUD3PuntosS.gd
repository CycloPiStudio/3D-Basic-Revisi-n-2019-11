extends MarginContainer

onready var label = $TextureRect/HBoxContainer/Puntos

func _ready():
	pass

func _process(_delta):

	label.set_text(str(Global.puntos))
	
#	pass
