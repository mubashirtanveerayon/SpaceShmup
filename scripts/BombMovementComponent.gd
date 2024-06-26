extends "res://scripts/ProjectileMovementComponent.gd"

@export var friction:int = 25
@export var max_delta_rotation:float=1.5
func _ready():
	var player = get_tree().get_first_node_in_group("player")
	if player != null:
		velocity=(player.global_position - global_position).normalized() * max_speed
	#velocity=(get_global_mouse_position() - global_position).normalized() * max_speed
	max_delta_rotation = max_delta_rotation * (1 if randf()>0.5 else -1)
	
func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO,friction*delta)
	owner.global_rotation += max_delta_rotation * delta
	max_delta_rotation = lerp(max_delta_rotation,0.0,delta)
	super._physics_process(delta)
