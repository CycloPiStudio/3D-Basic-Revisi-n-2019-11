extends MarginContainer

var vida 
var poseedorVida 		#Esta variable es para el personaje, enemigo u objeto al que le vamos a aplicar la vida
var barraVida

func _ready():
	barraVida = $TextureProgress
	poseedorVida = get_node("/root/partida/PosicionSalida/personaje") #Tenemos que conseguir el nodo que tiene la vida
	barraVida.set_position(Vector2(get_viewport_rect().size.x/4,10)) #Coloca la barra de vida en el viewport 2D
	set_bar_vida()
	pass

func _process(delta):
#	print (get_parent().name)
#	print (get_parent().vida)
#	print (Global.vida)
	vida = poseedorVida.vida #El padre al que se instancie este nodo tiene que tener una variable vida
	barraVida.value = vida
	
	pass

func set_bar_vida():
	barraVida.max_value = Global.vida #No deberia ser Global, tiene que ser respecto del poseedorVida
	barraVida.min_value = 0
	barraVida.value = Global.vida #No deberia ser Global, tiene que ser respecto del poseedorVida