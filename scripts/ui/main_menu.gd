extends Control


var level1_scene :PackedScene = preload("res://scenes/world.tscn")
var level2_scene :PackedScene = preload("res://scenes/boss_fight.tscn")


var level1:Node2D
var level2:Node2D

signal enabled_changed

var enabled:bool=true:
	set(value):
		enabled=value
		enabled_changed.emit()
func _ready():
	enabled_changed.connect(on_enabled_changed)
	
func on_enabled_changed():
	%Level1Button.disabled = not enabled
	%Level2Button.disabled = not enabled
	%QuitButton.disabled = not enabled
	if enabled:
		show()
		$ParallaxBackground.show()
	else:
		hide()
		$ParallaxBackground.hide()
func on_pause(uid:int):
	enabled=true
	show()
	
	
func _on_level_1_button_button_down():
	if level1 == null:
		level1=level1_scene.instantiate()
		level1.game_pause_triggered.connect(on_pause)
		
		if get_tree().paused:
			
			if level2 != null:
				level2.queue_free()
			get_tree().paused=false
		get_tree().root.add_child(level1)
	else:

		level1.resume()
	enabled = false


func _on_level_2_button_button_down():
	if level2 == null:
		level2=level2_scene.instantiate()
		level2.game_pause_triggered.connect(on_pause)
		
		if get_tree().paused:
			if level1 != null:
				level1.queue_free()
			get_tree().paused=false
		get_tree().root.add_child(level2)
	else:
		
		level2.resume()
	enabled = false


func _on_quit_button_button_down():
	get_tree().quit()
