extends Node

var MiNodoHUD

var posi1 = Vector2(815,40)

var tiempoPartida
var preTime = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GarfTiempo

var preDatos = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GraficaVida

var prePuntos = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GrafPuntos

var preArma = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GrafArma

var preInfo = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GrafInfo

var preNivel = preload("res://Ejecutable/Juego/HUD/HUD Datos Comunes/Datos_comunes.tscn").instance()
var GrafNivel

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_child(preDatos)
	GraficaVida = get_node("/root/partida/HUD/Datos_comunes/Label_datos_comunes")
	GraficaVida.set_text("Aquí pondré la vida actualizada")
	GraficaVida.set_position(posi1)
	
	add_child(preTime)
	MiNodoHUD = get_children()
	MiNodoHUD[9].set_name("Text_Tiempo")
	GarfTiempo = get_node("/root/partida/HUD/Text_Tiempo/Label_datos_comunes")
	GarfTiempo.set_position(Vector2(posi1.x , posi1.y+40))
	
	add_child(prePuntos)
	MiNodoHUD = get_children()
	MiNodoHUD[10].set_name("Text_Puntos")
	GrafPuntos = get_node("/root/partida/HUD/Text_Puntos/Label_datos_comunes")
	GrafPuntos.set_position(Vector2(posi1.x , posi1.y+80))
	
	add_child(preArma)
	MiNodoHUD = get_children()
	MiNodoHUD[11].set_name("Text_Arma")
	GrafArma = get_node("/root/partida/HUD/Text_Arma/Label_datos_comunes")
	GrafArma.set_position(Vector2(posi1.x , posi1.y+120))
	
	add_child(preNivel)
	MiNodoHUD = get_children()
	MiNodoHUD[12].set_name("Text_Nivel")
	GrafNivel = get_node("/root/partida/HUD/Text_Nivel/Label_datos_comunes")
	GrafNivel.set_position(Vector2(posi1.x , posi1.y+160))
	
	add_child(preInfo)
	MiNodoHUD = get_children()
	MiNodoHUD[13].set_name("Text_Info")
	GrafInfo = get_node("/root/partida/HUD/Text_Info/Label_datos_comunes")
	GrafInfo.set_position(Vector2(posi1.x , posi1.y+200))
	GrafInfo.set_text("En scrip: Cuidado con las IDs sumar una a cada set name, cuando instances se añaden nodos manual")
	

func _process(delta):
	#Actualizo valor de pantalla "La vida: 
	GraficaVida.set_text("La vida: "+ str(Global.vida)+" con scrip")
	#Actualizo valor de pantalla "Tiempo transcurrido:
	tiempoPartida = get_node("/root/partida/HUD/HUD2tiempoNodo").get("start_time")
	GarfTiempo.set_text("Tiempo transcurrido: "+ str((OS.get_ticks_msec() - tiempoPartida)/1000)+" s (scrip)")
	##Actualizo valor de pantalla "Los puntos:
	GrafPuntos.set_text("Los puntos: "+ str(Global.puntos)+" con scrip")

	##Actualizo valor de pantalla "Los puntos:
	GrafArma.set_text("El arma: "+ str(Global.arma)+" con scrip")
	
	##Actualizo valor de pantalla "Los puntos:
	GrafNivel.set_text("El nivel: "+ str(Global.pantalla)+" con scrip")
	
	pass
