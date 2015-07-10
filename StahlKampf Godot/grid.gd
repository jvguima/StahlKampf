
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var cell_size = 80

func _input(ev):
   # Mouse in viewport coordinates
	if (ev.type==InputEvent.MOUSE_BUTTON):
		print("Mouse Click/Unclick at: ",ev.pos/80)
	elif (ev.type==InputEvent.MOUSE_MOTION):
		print("Mouse Motion at: ",ev.pos/80)
	
	var tileID = get_node("TileMap").get_cell(ev.pos.x/80,ev.pos.y/80)
   
	print(tileID)
   # Print the size of the viewport

	print("Viewport Resolution is: ",get_viewport_rect().size)

func _ready():
	set_process_input(true)
	# Initialization here
	
	var tilePosX = -get_node("guy").get_pos().x / cell_size
	var tilePosY = -get_node("guy").get_pos().y / cell_size
	
	var tileID = get_node("TileMap").get_cell(tilePosX,tilePosY)
   
	print(tileID)
	
	#get_node("Label").set_text(y)
	pass


