extends "res://scripts/projectile.gd"


func _on_ready():
	
	$Sprite2D.material.set_shader_parameter("enabled",true)
	await get_tree().create_timer(0.1).timeout
	$Sprite2D.material.set_shader_parameter("enabled",false)
