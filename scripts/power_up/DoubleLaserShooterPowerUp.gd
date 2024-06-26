extends PowerUp
var double_laser_shooter_scene:PackedScene = preload("res://scenes/double_laser_shooter.tscn")
@export var double_laser_power_up_duration:float=10
func apply(player:CharacterBody2D):
	
	#var player_laser_shooter = player.find_child("LaserShooter")
	#if player_laser_shooter != null:
		#player.remove_child(player_laser_shooter)
		#player_laser_shooter.queue_free()
		#var double_laser_shooter=double_laser_shooter_scene.instantiate()
		#player.add_child(double_laser_shooter)
		#double_laser_shooter.set_owner(player)
	
	$CollisionShape2D.set_deferred("disabled",true)
	var laser_shooter = player.find_child("LaserShooter",false)
	if laser_shooter != null and laser_shooter.enabled:
		var double_laser_shooter = player.find_child("DoubleLaserShooter",false)
		if double_laser_shooter != null:
			laser_shooter.enabled=false
			double_laser_shooter.enabled = true
			await get_tree().create_timer(double_laser_power_up_duration).timeout
			if laser_shooter != null and double_laser_shooter != null:
				laser_shooter.enabled=true
				double_laser_shooter.enabled = false
			
	successful.emit()
