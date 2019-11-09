extends Node

# Default game port
const DEFAULT_PORT = 10567 # ¿porque este?

# Max number of players
const MAX_PEERS = 12

# Name for my player
var player_name = "The Warrior"

# Names for remote players in id:name format
var players = {} # diccionario para guardar ¿nombre o id?
# parece que las keis en este diccionario son números ==> id?

# Signals to let lobby GUI know what's going on
# Se crean señales para poner en la gráfica (GUI) de los menús lo que estápasadndo
signal player_list_changed() # ha cambiado la lista de los palyers
signal connection_failed() # conexion fallida
signal connection_succeeded() # conexion fallida
signal game_ended() # game terminado 
signal game_error(what)  # game error y devuelve un argumento ¿ cual? 

# Callback from SceneTree
# llamada desde arbol, ¿ a quien llama el arbol?
# ¿ Porque llama el arbol?, ¿no llama servidor?
func _player_connected(_id):  # _id, que es? un argumento
	# This is not used in this demo, because _connected_ok is called for clients
	# esto no lo usa en la demo, porque creará una función _connected_ok, q
	#_connected_ok, que será llamada por los clientes

	# on success and will do the job.
	# con existo y hará el trabajo
	pass

# Callback from SceneTree
# llamada desde arbol, ¿ a quien llama el arbol?
# ¿ Porque llama el arbol?, ¿no llama servidor?
# funciona para desonectar jugador
func _player_disconnected(id): # hay que pasarle la id como argumento
	# Condición: que el arbol, en su propiedad de multiplayer , está como  servidor
	if get_tree().is_network_server():
		# Método has_node devuelve true, si hay un nodo en la dirección del argumento
		# Condición: que en la dirección hay un nodo
		if has_node("/root/world"): # Game is in progress
			# Método emit_signal, se le pasa el primer argumento El nombre de la señal definida
			# y el segundo argumento, en este caso que la señal además lleva un argumento tipo texto
			emit_signal("game_error", "Player " + players[id] + " disconnected")
			#llama a  end_game(), es una función craada en este scrip
			end_game()
		# Condición: que el arbol, en su propiedad de multiplayer, NO está como  servidor
		else: # Game is not in progress
			# If we are the server, send to the new dude all the already registered players
			# Si nosostro estamos en servidor
			# envia todo sobre  nuevos colegas a los clientes registradso
			# unregister_player(id) es una función que crea más alante , hay que pasarle la ide como argumento, 
			unregister_player(id)
			# contador p_id definico para recorrer el diccionario
			for p_id in players:
				# Erase in the server
				# Método rpc_id: hay que pasarle: id que mira, 
				# la funcion que le vas a mandar , y otro argu opcional con la 
				# la ide , que esl argumento que se la pasado a esta función
				rpc_id(p_id, "unregister_player", id)

# Callback from SceneTree, only for clients (not server)
func _connected_ok():
	# Registration of a client beings here, tell everyone that we are here
	rpc("register_player", get_tree().get_network_unique_id(), player_name)
	emit_signal("connection_succeeded")

# Callback from SceneTree, only for clients (not server)
func _server_disconnected():
	emit_signal("game_error", "Server disconnected")
	end_game()

# Callback from SceneTree, only for clients (not server)
func _connected_fail():
	get_tree().set_network_peer(null) # Remove peer
	emit_signal("connection_failed")

# Lobby management functions

remote func register_player(id, new_player_name):
	if get_tree().is_network_server():
		# If we are the server, let everyone know about the new player
		rpc_id(id, "register_player", 1, player_name) # Send myself to new dude
		for p_id in players: # Then, for each remote player
			rpc_id(id, "register_player", p_id, players[p_id]) # Send player to new dude
			rpc_id(p_id, "register_player", id, new_player_name) # Send new dude to player

	players[id] = new_player_name
	emit_signal("player_list_changed")

remote func unregister_player(id):
	players.erase(id)
	emit_signal("player_list_changed")

remote func pre_start_game(spawn_points):
	# Change scene
	var world = load("res://world.tscn").instance()
	get_tree().get_root().add_child(world)

	get_tree().get_root().get_node("lobby").hide()

	var player_scene = load("res://player.tscn")

	for p_id in spawn_points:
		var spawn_pos = world.get_node("spawn_points/" + str(spawn_points[p_id])).position
		var player = player_scene.instance()

		player.set_name(str(p_id)) # Use unique ID as node name
		player.position=spawn_pos
		player.set_network_master(p_id) #set unique id as master

		if p_id == get_tree().get_network_unique_id():
			# If node for this peer id, set name
			player.set_player_name(player_name)
		else:
			# Otherwise set name from peer
			player.set_player_name(players[p_id])

		world.get_node("players").add_child(player)

	# Set up score
	world.get_node("score").add_player(get_tree().get_network_unique_id(), player_name)
	for pn in players:
		world.get_node("score").add_player(pn, players[pn])

	if not get_tree().is_network_server():
		# Tell server we are ready to start
		rpc_id(1, "ready_to_start", get_tree().get_network_unique_id())
	elif players.size() == 0:
		post_start_game()

remote func post_start_game():
	get_tree().set_pause(false) # Unpause and unleash the game!

var players_ready = []

remote func ready_to_start(id):
	assert(get_tree().is_network_server())

	if not id in players_ready:
		players_ready.append(id)

	if players_ready.size() == players.size():
		for p in players:
			rpc_id(p, "post_start_game")
		post_start_game()

func host_game(new_player_name):
	player_name = new_player_name
	var host = NetworkedMultiplayerENet.new()
	host.create_server(DEFAULT_PORT, MAX_PEERS)
	get_tree().set_network_peer(host)

func join_game(ip, new_player_name):
	player_name = new_player_name
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(host)

func get_player_list():
	return players.values()

func get_player_name():
	return player_name

func begin_game():
	assert(get_tree().is_network_server())

	# Create a dictionary with peer id and respective spawn points, could be improved by randomizing
	var spawn_points = {}
	spawn_points[1] = 0 # Server in spawn point 0
	var spawn_point_idx = 1
	for p in players:
		spawn_points[p] = spawn_point_idx
		spawn_point_idx += 1
	# Call to pre-start game with the spawn points
	for p in players:
		rpc_id(p, "pre_start_game", spawn_points)

	pre_start_game(spawn_points)

func end_game():
	if has_node("/root/world"): # Game is in progress
		# End it
		get_node("/root/world").queue_free()

	emit_signal("game_ended")
	players.clear()
	get_tree().set_network_peer(null) # End networking

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self,"_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
