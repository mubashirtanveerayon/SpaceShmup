extends "res://scripts/projectile.gd"


func destroy():
	
	disable()
	$Explosion.play()

func _on_explosion_finished():
	queue_free()
