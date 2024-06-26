extends "res://scripts/actor.gd"
@export var unique_id:int

signal enemy_dead(uid:int,death_point:int)

func _ready():
	dead.connect(func(death_point)->void:enemy_dead.emit(unique_id,death_point))
	$Explosion.finished.connect(queue_free)
	

	
func destroy():
	disable()
	$Visual.hide()
	$Explosion.play()






