
extends Node2D

# Propriedades
export var moves = 4 #numero de moves
export var hp = 2
export var atk = 1 #Attack
export var rng = 1 #Range of Attack


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

func _process(delta):
	var unit_pos = get_pos()
	
	if(Input.is_action_pressed("move_unit_down") && currentMoves>0):
		OS.delay_usec(200)
		unit_pos.y+=80
		currentMoves = currentMoves - 1
		Input.is_action_pressed("move_unit_down") = false
		
	if(Input.is_action_pressed("move_unit_up") && currentMoves>0):
		unit_pos.y+=-80
		currentMoves = currentMoves - 1
		#OS.delay_usec(200)

		
	if(Input.is_action_pressed("move_unit_left") && currentMoves>0):
		unit_pos.x+=-80
		currentMoves = currentMoves - 1
		#OS.delay_usec(200)
		
	if(Input.is_action_pressed("move_unit_right")&& currentMoves>0):
		unit_pos.x+=80
		currentMoves = currentMoves - 1
		#OS.delay_usec(200)
		
	if(currentMoves <= 0):
		print("Out of moves")
		active = false
		set_process(false)
	
	set_pos(unit_pos)
	