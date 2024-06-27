extends Node2D
class_name State

var enabled:bool=false
var object:Node2D



func _ready():
	set_process(false)
	set_physics_process(false)

func enter():
	enabled = true
	
	set_process(true)
	set_physics_process(true)


func exit():
	enabled = false
	
	set_process(false)
	set_physics_process(false)

	
