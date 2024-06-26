extends "res://scripts/ProjectileMovementComponent.gd"


func _ready()->void:
	velocity = Vector2.DOWN * max_speed
