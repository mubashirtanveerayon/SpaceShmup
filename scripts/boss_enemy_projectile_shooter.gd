extends "res://scripts/Spawner.gd"

@export_range(0,180) var spread:int=45
@export var step:int = 12
@export var interval:float=0.3



func spawn():
	if spawn_markers.is_empty():
		return
	enabled = false
	
	var current_step=step
	
	while current_step<=spread:
		var object_spawn_location = spawn_markers.pick_random().global_position
		var object = object_scene.instantiate()
		object.global_position = object_spawn_location
		
		for child in object.get_children():
			if child is ProjectileMovementComponent:
				child.velocity = Vector2.DOWN.rotated(deg_to_rad(current_step)).normalized() * child.max_speed
				break
		owner.add_sibling(object)
		object = object_scene.instantiate()
		object.global_position = object_spawn_location
		
		for child in object.get_children():
			if child is ProjectileMovementComponent:
				child.velocity = Vector2.DOWN.rotated(deg_to_rad(-current_step)).normalized() * child.max_speed
				break
		
		owner.add_sibling(object)
		
		
		await get_tree().create_timer(interval).timeout
		current_step += step
	
	enabled = true
