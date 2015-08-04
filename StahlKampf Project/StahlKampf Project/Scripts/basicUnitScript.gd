extends Node2D

# Propriedades
export var moves = 4 #numero de moves
export var hp = 2
export var atk = 1 #Attack
export var rng = 1 #Range of Attack

var coordinates = get_pos()/80
var active
var currentMoves
var options = 0
var tile
arr

func _ready():
	active = false
	set_process_input(false)
	pass
	"""get_node("../up").connect("pressed",self,"_set_option_1")
	get_node("../down").connect("pressed",self,"_set_option_2")
	get_node("../links").connect("pressed",self,"_set_option_3")
	get_node("../rechts").connect("pressed",self,"_set_option_4")
	
	pass
func _set_option_up():
	options=1
func _set_option_down():
	options=2
func _set_option_rechts():
	options=3
func _set_option_links():
	options=4"""


#func get_moves():
#	return moves
#	pass

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
	#print("Terrain: ",tile)
	if (tile == 0): 
		return 2
	if (tile == 1): 
		return 1
	else:
		return 1
	pass

func _process(delta):
	var unit_pos = get_pos()
	coordinates = get_pos()/80
	
	if(currentMoves - terrain(coordinates.x,coordinates.y) < 0 or currentMoves == 0):
		print("Out of moves")
		get_node("..").turn_processing()
		active = false
		set_process(false)
	
	elif(options==2):
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.y+=80
		options=0
		
	elif(options==1):
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.y-=80
		options=0
		
	elif(options==3):
		currentMoves = currentMoves - terrain(coordinates.x,coordinates.y)
		unit_pos.x-=80
		options=0
		
	elif(options==4):
		currentMoves = currentMoves - terrain(coordinates.x+1,coordinates.y)
		unit_pos.x+=80
		options=0
		
	print("Moves: ",currentMoves)
	set_pos(unit_pos)
	
	update()



func walk_preview(i, j, remainMoves):
	draw_rect(Rect2(i*80-get_pos().x-32, j*80-get_pos().y-32, 80, 80), Color(0,0,1,0.3))
	
	if(remainMoves - terrain(i,j) < 0 or remainMoves <= 0):
		
		return
	else:
		remainMoves -= terrain(i,j)
		
		#left
		walk_preview(i-1, j, remainMoves)
		#right
		walk_preview(i+1, j, remainMoves)
		#up
		walk_preview(i, j-1, remainMoves)
		#down
		walk_preview(i, j+1, remainMoves)


func _draw():
	if (active):
		walk_preview(coordinates.x,coordinates.y, currentMoves)
		

