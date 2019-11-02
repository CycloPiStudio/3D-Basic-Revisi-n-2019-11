extends Node2D


#func _ready():
#
#	pass

func _process(delta):
	if $".".get_children()[0].is_playing() == false:
		var video = $".".get_children()[0].play()
		print (video) # Se necesita hacer un print para visualizar el video

#	pass
