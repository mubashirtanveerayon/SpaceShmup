extends Node2D

signal spawn_interval_changed
signal spawned_objects(objects:Array[Node2D])

@export var add_as_owner_sibling:bool=true
@export var enabled:bool = true
@export var object_scene:PackedScene
@export var spawn_interval:float=1:
	set(value):
		spawn_interval = value
		spawn_interval_changed.emit()

var spawn_markers:Array[Marker2D]


func _ready():
	spawn_interval_changed.connect(_on_spawn_interval_changed)
	$Timer.wait_time = spawn_interval
	$Timer.start()
	for child in get_children():
		if child is Marker2D:
			spawn_markers.append(child)


func _on_spawn_interval_changed():
	$Timer.wait_time = spawn_interval

func spawn():

	var objects:Array[Node2D]
	for marker in spawn_markers:
		var spawn_position := marker.global_position
		var object = object_scene.instantiate()
		object.global_position = spawn_position
		if add_as_owner_sibling:
			owner.add_sibling(object)
		else:
			add_sibling(object)
		objects.append(object)
	spawned_objects.emit(objects)

func _on_timer_timeout():
	if enabled and object_scene != null:
		spawn()
