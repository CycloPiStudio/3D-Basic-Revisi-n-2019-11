extends MarginContainer

onready var start_time = OS.get_ticks_msec()
onready var label = $TextureRect/HBoxContainer/Tiempo


func _process(delta):

	label.set_text(str((OS.get_ticks_msec() - start_time)/1000))
	