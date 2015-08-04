
extends Node2D

# member variables here, example:


var cell_size = 80
var units = []
var movements 
var activeUnit
var aux = 0
var playerTurn = bool("true")
var unitSelected = false

#--------------------------------------------------------------------------------	


func _input(ev):

		
	if (ev.type==InputEvent.MOUSE_MOTION):
		var posX = int(ev.pos.x/cell_size)
		var posY = int(ev.pos.y/cell_size)
		
		get_node("Control/Cursor").set_pos(Vector2(posX*80,posY*80))
		
		
		
	if(ev.type==InputEvent.MOUSE_BUTTON):
		var i=units.size()-1
		var posX = int(ev.pos.x/cell_size)
		var posY = int(ev.pos.y/cell_size)
		print("Mouse Click/Unclick at: ",posX, " ", posY)
		var tileID = get_node("TileMap").get_cell(posX,posY)
		print("tile" + str (tileID))
		#if (!unitSelected):
		while(i>=0):
			activeUnit = units[i]
			var unit_pos = get_node(activeUnit).get_pos()
			if(posX==int(unit_pos.x/80) && posY==int(unit_pos.y/80)):
				get_node(activeUnit).set_active()
				get_node("Control").hide()
				unitSelected = true
			i -= 1
		
		
	#if (ev.type == InputEvent.MOUSE_BUTTON): #MOVIMENTAÇÃO COM MOUSE
		#Pega a posição atual da unidade, vê a diferença em tiles do destino, calcula o vector2 e seta a posição
	#	var unitCurrentX = get_node(activeUnit).get_pos().x
	#	var unitCurrentY = get_node(activeUnit).get_pos().y
		
		#Numero de tiles para se mover em X e Y
	#	var checkX = int( (ev.pos.x - unitCurrentX) / 80 )
	#	var checkY = int( (ev.pos.y - unitCurrentY) / 80 ) 
		
		#calcula o que deveria ser a nova posição
	#	var newPosX = float( unitCurrentX + 80*checkX )
	#	var newPosY = float( unitCurrentY + 80*checkY )
	#	var newPos = Vector2(newPosX, newPosY)
		
		#FAZER CHECAGENS AQUI
	#	get_node(activeUnit).set_pos(newPos)
	#	OS.delay_msec(100)
	#	aux +=  1

#-----------------------------------------------------------------------------


func _process(delta):
	#OS.delay_msec(90)
	
	#for aux in range(units.size()):
	
	#-------------------------------
	#MOVIMENTO POR TECLADO
	
	#while (playerTurn == true):
	#while (movements != 0):
		
	#activeUnit = units[aux]
	#var unit_pos = get_node(activeUnit).get_pos()
	#get_node("Control/Cursor").set_pos(unit_pos + Vector2(8.0,8.0))
	
	#if(!get_node(activeUnit).is_active()):
	#	unitSelected = false
	#	get_node("Control").show()

	"""if(Input.is_action_pressed("change_Unit")):
		aux = aux+1
		if(aux >= units.size()):
			aux = 0
	
	if(Input.is_action_pressed("select_unit")):
		get_node(activeUnit).set_active()
		get_node("Control").hide()
		unitSelected = true
		set_process(false)"""
	
	
func _ready():

	set_process_input(true)
	set_process(true)
	
	#Inicialização do vetor de unidades
	units.insert(0, "UnitNode2d")
	units.insert(1, "UnitNode2d1")
	print("Unit size:",units.size())
	
	#get_node("Label").set_text(y)
	pass


func turn_processing():
	set_process(true)