extends Node2D

signal spawn_interval_probability_changed

@export var power_up_scenes:Array[PackedScene]

@export var spawn_interval_probability:float=2:
	set(value):
		spawn_interval_probability = value
		spawn_interval_probability_changed.emit()
var spawn_markers:Array[Marker2D]
func _ready():
	spawn_interval_probability_changed.connect(on_spawn_interval_probability_changed)
	for child in get_children():
		if child is Marker2D:
			spawn_markers.append(child)
	$Timer.wait_time = spawn_interval_probability
	$Timer.start()
	
func on_spawn_interval_probability_changed():
	$Timer.wait_time = spawn_interval_probability
	


func spawn_power_up():
	if power_up_scenes.is_empty() or spawn_markers.is_empty():
		return
	
	var spawn_location = spawn_markers.pick_random().global_position
	var power_up = power_up_scenes.pick_random().instantiate()
	power_up.global_position = spawn_location
	add_sibling(power_up)

func _on_timer_timeout():
	if randf()>0.5:
		spawn_power_up()
