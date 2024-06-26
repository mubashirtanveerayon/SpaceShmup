extends CharacterBody2D


signal dead(point)

@export var death_point:int=0

func destroy():
	queue_free()

func _on_health_system_destroyed():
	dead.emit(death_point)
	destroy()

func disable():
	set_physics_process(false)
	set_process(false)
	$MovementComponent.disable()
	$HealthSystem.disable()
