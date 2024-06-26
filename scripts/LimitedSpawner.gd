extends "res://scripts/Spawner.gd"

@export var max:int=5

var spawned:int=0

func _on_spawned_objects(objects:Array[Node2D])->void:
	for object in objects:
		
		object.tree_exiting.connect(on_object_tree_exiting)
	spawned += objects.size()

func on_object_tree_exiting()->void:
	if spawned == 0:
		return
	spawned -= 1
	

func spawn():
	if spawned>=max:
		return
	super.spawn()


