extends "res://scripts/projectile.gd"

@export var detonation_time:float = 1.5


func _ready():
	super._ready()
	$Timer.wait_time = detonation_time
	$Timer.start()

func destroy():
	$CollisionShape2D.set_deferred("disabled",false)
	$Visual.hide()
	$Explosion.play()


func _on_explosion_finished():
	queue_free()



func _on_timer_timeout():
	destroy()
