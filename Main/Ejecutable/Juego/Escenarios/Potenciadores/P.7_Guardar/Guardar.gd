extends Spatial
#
#var tiempo = false
#
#func _on_Area_body_entered(body):
#	if tiempo == false:
#		if body.is_in_group("Player"):
#			$Popup.show()
##			_on_LineEdit_text_entered(Global.nombre_guardado)
#			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#			get_tree().paused = true
#
#
#
#func _on_Restaurar_partida_pressed():
#	get_tree().paused = false
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$Popup.hide()
#	tiempo = true
#	$"Baul /Area/Timer".start()
#
#func _on_Timer_timeout():
#	tiempo = false
#
#func _ready():
#	$Popup.set_position(Vector2(get_viewport().size.x/4 , get_viewport().size.y/4))
#	$"Popup/Guardados/Guardado 1/NombreGuardado1".set_text(Global.nombre_guardado1)
#	$"Popup/Guardados/Guardado 2/NombreGuardado2".set_text(Global.nombre_guardado2)
#	$"Popup/Guardados/Guardado 3/NombreGuardado3".set_text(Global.nombre_guardado3)
#	$"Popup/Guardados/Guardado 4/NombreGuardado4".set_text(Global.nombre_guardado4)
#
#
## Ranura 1 de guardado___________________________________________
#var guarda1
#func _on_Guardado_1_pressed():
#	$"Popup/Guardados/Guardado 1/Nombre1".show()
#	$"Popup/Guardados/Guardado 2/Nombre2".hide()
#	$"Popup/Guardados/Guardado 3/Nombre3".hide()
#	$"Popup/Guardados/Guardado 4/Nombre4".hide()
#
#	$"Popup/Guardados/Guardado 1/NombreGuardado1".hide()
#	$"Popup/Guardados/Guardado 2/NombreGuardado2".show()
#	$"Popup/Guardados/Guardado 3/NombreGuardado3".show()
#	$"Popup/Guardados/Guardado 4/NombreGuardado4".show()
#
#	$"Popup/Guardados/Guardado 1/Guardar1".show()
#	$"Popup/Guardados/Guardado 2/Guardar2".hide()
#	$"Popup/Guardados/Guardado 3/Guardar3".hide()
#	$"Popup/Guardados/Guardado 4/Guardar4".hide()
#
#	$"Popup/Guardados/Guardado 2".set_pressed(false)
#	$"Popup/Guardados/Guardado 3".set_pressed(false)
#	$"Popup/Guardados/Guardado 4".set_pressed(false)
#	pass
#func _on_Nombre1_text_changed(new_text):
#	guarda1 = new_text
#	pass
#func _on_Guardar1_pressed():
#	get_tree().paused = false
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$Popup.hide()
#	tiempo = true
#	Global.nombre_guardado1 =guarda1
#	Global.guardar(Global.nombre_guardado1)
#	$"Baul /Area/Timer".start()
#	guardadoPersistente(Global.nombre_guardado1)
#	pass	
#
## Ranura 2 de guardado___________________________________________
#var guarda2
#func _on_Guardado_2_pressed():
#	$"Popup/Guardados/Guardado 1/Nombre1".hide()
#	$"Popup/Guardados/Guardado 2/Nombre2".show()
#	$"Popup/Guardados/Guardado 3/Nombre3".hide()
#	$"Popup/Guardados/Guardado 4/Nombre4".hide()
#
#	$"Popup/Guardados/Guardado 1/NombreGuardado1".show()
#	$"Popup/Guardados/Guardado 2/NombreGuardado2".hide()
#	$"Popup/Guardados/Guardado 3/NombreGuardado3".show()
#	$"Popup/Guardados/Guardado 4/NombreGuardado4".show()
#
#	$"Popup/Guardados/Guardado 1/Guardar1".hide()
#	$"Popup/Guardados/Guardado 2/Guardar2".show()
#	$"Popup/Guardados/Guardado 3/Guardar3".hide()
#	$"Popup/Guardados/Guardado 4/Guardar4".hide()
#
#	$"Popup/Guardados/Guardado 1".set_pressed(false)
#	$"Popup/Guardados/Guardado 3".set_pressed(false)
#	$"Popup/Guardados/Guardado 4".set_pressed(false)
#	pass # replace with function body
#func _on_Nombre2_text_changed(new_text):
#	guarda2 = new_text
#	pass # replace with function body
#func _on_Guardar2_pressed():
#	get_tree().paused = false
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$Popup.hide()
#	tiempo = true
#	Global.nombre_guardado2 = guarda2
#	Global.guardar(Global.nombre_guardado2)
#	$"Baul /Area/Timer".start()
#	guardadoPersistente(Global.nombre_guardado2)
#	pass # replace with function body
#
## Ranura 3 de guardado___________________________________________
#var guarda3
#func _on_Guardado_3_pressed():
#	$"Popup/Guardados/Guardado 1/Nombre1".hide()
#	$"Popup/Guardados/Guardado 2/Nombre2".hide()
#	$"Popup/Guardados/Guardado 3/Nombre3".show()
#	$"Popup/Guardados/Guardado 4/Nombre4".hide()
#
#	$"Popup/Guardados/Guardado 1/NombreGuardado1".show()
#	$"Popup/Guardados/Guardado 2/NombreGuardado2".show()
#	$"Popup/Guardados/Guardado 3/NombreGuardado3".hide()
#	$"Popup/Guardados/Guardado 4/NombreGuardado4".show()
#
#	$"Popup/Guardados/Guardado 1/Guardar1".hide()
#	$"Popup/Guardados/Guardado 2/Guardar2".hide()
#	$"Popup/Guardados/Guardado 3/Guardar3".show()
#	$"Popup/Guardados/Guardado 4/Guardar4".hide()
#
#	$"Popup/Guardados/Guardado 1".set_pressed(false)
#	$"Popup/Guardados/Guardado 2".set_pressed(false)
#	$"Popup/Guardados/Guardado 4".set_pressed(false)
#	pass # replace with function body
#func _on_Nombre3_text_changed(new_text):
#	guarda3 = new_text
#	pass # replace with function body
#func _on_Guardar3_pressed():
#	get_tree().paused = false
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$Popup.hide()
#	tiempo = true
#	Global.nombre_guardado3 = guarda3
#	Global.guardar(Global.nombre_guardado3)
#	$"Baul /Area/Timer".start()
#	guardadoPersistente(Global.nombre_guardado3)
#	pass # replace with function body
#
## Ranura 4 de guardado___________________________________________
#var guarda4
#func _on_Guardado_4_pressed():
#	$"Popup/Guardados/Guardado 1/Nombre1".hide()
#	$"Popup/Guardados/Guardado 2/Nombre2".hide()
#	$"Popup/Guardados/Guardado 3/Nombre3".hide()
#	$"Popup/Guardados/Guardado 4/Nombre4".show()
#
#	$"Popup/Guardados/Guardado 1/NombreGuardado1".show()
#	$"Popup/Guardados/Guardado 2/NombreGuardado2".show()
#	$"Popup/Guardados/Guardado 3/NombreGuardado3".show()
#	$"Popup/Guardados/Guardado 4/NombreGuardado4".hide()
#
#	$"Popup/Guardados/Guardado 1/Guardar1".hide()
#	$"Popup/Guardados/Guardado 2/Guardar2".hide()
#	$"Popup/Guardados/Guardado 3/Guardar3".hide()
#	$"Popup/Guardados/Guardado 4/Guardar4".show()
#
#	$"Popup/Guardados/Guardado 1".set_pressed(false)
#	$"Popup/Guardados/Guardado 2".set_pressed(false)
#	$"Popup/Guardados/Guardado 3".set_pressed(false)
#	pass # replace with function body
#func _on_Nombre4_text_changed(new_text):
#	guarda4 = new_text
#	pass # replace with function body
#func _on_Guardar4_pressed():
#	get_tree().paused = false
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$Popup.hide()
#	tiempo = true
#	Global.nombre_guardado4 = guarda4
#	Global.guardar(Global.nombre_guardado4)
#	$"Baul /Area/Timer".start()
#	guardadoPersistente(Global.nombre_guardado4)
#	pass # replace with function body
#
#
#func guardadoPersistente(_nombre):
#	Global.guardadoPersistente.open("user://game_saves/guardado_persistenete.sav", File.WRITE)
##	var nombre_guardado1 
##	var nombre_guardado2 
##	var nombre_guardado3 
##	var nombre_guardado4 
#	var persistencia = {
#	nombre_guardado1 = Global.nombre_guardado1,
#	nombre_guardado2 = Global.nombre_guardado2,
#	nombre_guardado3 = Global.nombre_guardado3,
#	nombre_guardado4 = Global.nombre_guardado4
#	}
#
#	Global.guardadoPersistente.store_line(to_json(persistencia))	
#	Global.guardadoPersistente.close()
##	print(nombre_guardado1,nombre_guardado2,nombre_guardado3,nombre_guardado4)
#
