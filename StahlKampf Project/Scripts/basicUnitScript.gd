
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
	print("Terrain: ",tile)
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
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.y+=80
		
	elif(Input.is_action_pressed("move_unit_up")):
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.y-=80
		#OS.delay_usec(200)
		
	elif(Input.is_action_pressed("move_unit_left")):
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.x-=80
		#OS.delay_usec(200)
		

	elif(Input.is_action_pressed("move_unit_right")):
		currentMoves = currentMoves - terrain(coordinates.x+1,coordinates.y)
		unit_pos.x+=80
		#OS.delay_usec(200)
		
	print("Moves: ",currentMoves)
	set_pos(unit_pos)
	#_draw()
	
	
	"""
Alguém depois tente entender porque a função não consegue desenhar

func verify_range():
	var walkpreview Rect2(get_pos().x,get_pos().y,80,80)
	var currentMoves = moves
	var blue Color(0,0,1)
	var aux = 0
	coordinates = get_pos()/80
	
	while(currentMoves - terrain(coordinates.x,coordinates.y) < 0 or currentMoves == 0):
		draw_rect(walkpreview, blue)
		currentMoves-=terrain(coordinates.x,coordinates.y)
		walkpreview.pos = vector2(walkpreview.x+80*aux, walkpreview.y)
		aux+=1
	
	aux=0
	while(currentMoves - terrain(coordinates.x,coordinates.y) < 0 or currentMoves == 0):
		draw_rect(walkpreview, blue)
		currentMoves-=terrain(walkpreview.x/80,walkpreview.y)
		walkpreview.pos = vector2(walkpreview.x-80*aux, walkpreview.y)
	

func _draw():
	if (active):
		verify_range()

"""



