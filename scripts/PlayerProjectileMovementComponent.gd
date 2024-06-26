extends "res://scripts/ProjectileMovementComponent.gd"

func _ready()->void:
	velocity = Vector2.UP * max_speed
