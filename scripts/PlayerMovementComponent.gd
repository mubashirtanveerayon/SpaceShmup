extends "res://scripts/MovementComponent.gd"

@onready var joystick:Control=get_tree().get_first_node_in_group("virtual_joystick")
@export var touch_input_dead_zone:int=80
@export var touch_input_max_speed:int=180

func _physics_process(delta)->void:
	#if Input.is_action_pressed("click") and joystick != null:
		#normalized_dir = joystick.output.normalized()
	#else:
		#normalized_dir = Vector2(Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"),Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")).normalized()
		
	var call_super:bool=true
	if Input.is_action_pressed("click"):
		var direction:Vector2 = get_global_mouse_position()-global_position
		
		if direction.length_squared()>=touch_input_dead_zone:
			velocity = direction.normalized() * touch_input_max_speed
			call_super=false
		else:
			normalized_dir=Vector2.ZERO
	else:
		normalized_dir=Vector2(Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"),Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up"))
	if call_super:
		super._physics_process(delta)
	else:
		owner.velocity = velocity
		owner.move_and_slide()
	#super._physics_process(delta)


