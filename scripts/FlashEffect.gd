extends Node2D

signal duration_changed
@export var trigger_flash_on:String
@export var signal_from:Node2D
@export var visual_node:CanvasItem


@export var duration:float = 0.3:
	set(value):
		duration = value
		duration_changed.emit()
		
func _ready():
	duration_changed.connect(on_duration_changed)
	$Timer.wait_time = duration
	#await signal_from.ready
	if signal_from.has_signal(trigger_flash_on):
		signal_from.connect(trigger_flash_on,flash)
	
func on_duration_changed():
	$Timer.wait_time = duration


func flash()->void:
	visual_node.material.set_shader_parameter("enabled",true)
	$Timer.start()


func _on_timer_timeout():
	visual_node.material.set_shader_parameter("enabled",false)
