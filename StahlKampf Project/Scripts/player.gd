
extends Node2D


var units = [] 
var movements 
var activeUnit
var playing # Se o jogador esta jogando ou não
var aux = 0
var unitSelected = false


#--------------------------------------------------------------------------------	



func add_unit(var i, var u):
	units.insert(i, u)
	pass
	
func rem_unit(var i, var u):
	units.remove(u)
	pass
	
func get_units_size():
	return units.size()
	pass


func set_playing():
	playing = true
	set_process(true)
	#currentMoves = moves
	pass

func is_playing():
	if (playing):
		return true
	else:
		return false
	pass



func _process(delta):
	OS.delay_msec(90)
		
	activeUnit = units[aux]
	
	var unit_pos = get_node(activeUnit).get_pos()
	get_node("../Control/Cursor").set_pos(unit_pos + Vector2(8.0,8.0))
	
	if(!get_node(activeUnit).is_active()):
		unitSelected = false
		get_node("../Control").show()

	if(Input.is_action_pressed("change_Unit")):
		aux = aux+1
		if(aux >= units.size()):
			aux = 0
	
	if(Input.is_action_pressed("select_unit")):
		get_node(activeUnit).set_active()
		get_node("../Control").hide()
		unitSelected = true
	
	pass


func _ready():
	playing = false
	set_process_input(false)	
	pass


