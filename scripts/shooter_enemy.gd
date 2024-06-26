extends "res://scripts/enemy.gd"


func _on_health_system_took_damage(damage_dealt):
	$HitSound.play()
