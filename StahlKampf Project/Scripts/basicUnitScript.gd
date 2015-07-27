
extends Node2D

# Propriedades
export var moves = 4 #numero de moves
export var hp = 2
export var atk = 1 #Attack
export var rng = 1 #Range of Attack

var coordinates = get_pos()/80
var active
var currentMoves

func _ready():
	active = false
	set_process_input(false)
	pass

func get_moves():
	return moves
	pass

func set_active():
	active = true
	set_process(true)
	currentMoves = moves
	pass

func is_active():
	if (active):
		return true
	else:
		return false
	pass

func terrain(x, y):
	var tile = get_node("../TileMap").get_cell(x,y)
	if (tile == 0): 
		return 2
	if (tile == 1): 
		return 1
	pass

func _process(delta):
	var unit_pos = get_pos()
	coordinates = get_pos()/80
	
	if(currentMoves - terrain(coordinates.x,coordinates.y) < 0 or currentMoves == 0):
		print("Out of moves")
		active = false
		set_process(false)
	
	elif(Input.is_action_pressed("move_unit_down")):
		unit_pos.y+=80
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y+1)
		
	elif(Input.is_action_pressed("move_unit_up")):
		unit_pos.y-=80
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y-1)
		#OS.delay_usec(200)

		
	elif(Input.is_action_pressed("move_unit_left")):
		unit_pos.x-=80
		currentMoves = currentMoves - terrain(coordinates.x-1,coordinates.y)
		#OS.delay_usec(200)
		

	elif(Input.is_action_pressed("move_unit_right")):
		unit_pos.x+=80
		currentMoves = currentMoves - terrain(coordinates.x+1,coordinates.y)
		#OS.delay_usec(200)
		
	
	set_pos(unit_pos)
	