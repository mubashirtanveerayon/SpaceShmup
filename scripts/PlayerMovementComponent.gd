extends "res://scripts/MovementComponent.gd"
	
var is_clicked:bool=false
@export var input_dead_zone_squared:int = 20
func _physics_process(delta)->void:
	
	if is_clicked:
		#velocity = (get_global_mouse_position() - global_position).normalized() * max_speed
		
		var input := get_global_mouse_position()-global_position
		
		if input.length_squared() > input_dead_zone_squared:
			normalized_dir = input.normalized()
		else:
			normalized_dir=Vector2.ZERO
	else:
		normalized_dir = Vector2(Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"),Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")).normalized()
	super._physics_process(delta)

func _unhandled_input(event:InputEvent):
	if event.is_action_pressed("click"):
		is_clicked = true
	elif event.is_action_released("click"):
		is_clicked = false
