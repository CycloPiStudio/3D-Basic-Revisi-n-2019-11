extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Node_mensa
#var mensaText

func _process(_delta):
	Node_mensa = get_node("Mensaje")
	Node_mensa.set_position(Vector2(Node_mensa.get_position().x,Node_mensa.get_position().y+1))
#	print(Node_mensa)
	pass
	
func _on_Timer_timeout():
#	print("esto que que que")
	queue_free()
	pass # replace with function body

func mostra_mensa(Mensa_tex, posiTex, danno):
	Node_mensa = get_node("Mensaje")
	Node_mensa.set_position(Vector2(get_viewport().size.x/posiTex , get_viewport().size.y/posiTex))
	Node_mensa.set_text(Mensa_tex)
	Global.vida -= danno
