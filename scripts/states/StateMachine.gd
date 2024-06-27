extends Node2D


class_name StateMachine

var states:Array[State]
var current_state:State
var prev_state:State
@export var initial_state:State

@export var object:Node2D
func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			child.object = object

	if initial_state!=null:
		initial_state.enter()
		current_state = initial_state



func change_state(to:State):
	if to == current_state:
		return
	
	if current_state != null:
		current_state.exit()
	to.enter()
	
	current_state=to

