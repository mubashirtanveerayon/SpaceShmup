extends Node2D


var velocity := Vector2.ZERO


@export var max_speed:int

func _physics_process(delta):
	velocity = velocity.limit_length(max_speed)
	owner.global_position += velocity * delta
