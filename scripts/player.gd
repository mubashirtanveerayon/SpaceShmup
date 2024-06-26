extends "res://scripts/actor.gd"

func _process(delta):
	if velocity.x < 0:
		$Visual/AnimatedSprite2D.play("left")
	elif velocity.x > 0:
		$Visual/AnimatedSprite2D.play("right")
	else:
		$Visual/AnimatedSprite2D.play("center")

func destroy():
	disable()
	$Visual.hide()
	$Explosion.play()


func _on_explosion_finished():
	queue_free()


func _on_health_system_took_damage(damage_dealt):
	$HitSound.play()
	$Visual/AnimatedSprite2D.material.set_shader_parameter("enabled",true)
	await get_tree().create_timer(0.5).timeout
	$Visual/AnimatedSprite2D.material.set_shader_parameter("enabled",false)
