extends Node2D
class_name MovementComponent

@export var acceleration:int
@export var max_speed:int
@export var friction:int

var velocity:=Vector2.ZERO
var normalized_dir:Vector2

func _physics_process(delta):
	if normalized_dir.length_squared()==0:
		velocity = velocity.move_toward(Vector2.ZERO,friction * delta)
	else:
		velocity = velocity.move_toward(normalized_dir * max_speed,acceleration * delta)
		velocity = velocity.limit_length(max_speed)
	owner.velocity = velocity
	owner.move_and_slide()
func disable():
	set_physics_process(false)
	set_process(false)
