
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var cell_size = 80

func _input(ev):
   # Mouse in viewport coordinates
	if (ev.type==InputEvent.MOUSE_BUTTON):
	
		var posX = int(ev.pos.x/cell_size)
		var posY = int(ev.pos.y/cell_size)
		
		print("Mouse Click/Unclick at: ",posX, " ", posY)
	elif (ev.type==InputEvent.MOUSE_MOTION):
		print("Mouse Motion at: ",posX, " " ,posY)
		
	var tileID = get_node("TileMap").get_cell(posX,posY)
   
	print(tileID)
   # Print the size of the viewport

	print("Viewport Resolution is: ",get_viewport_rect().size)

func _ready():
	set_process_input(true)
	# Initialization here
	
	#get_node("Label").set_text(y)
	pass


