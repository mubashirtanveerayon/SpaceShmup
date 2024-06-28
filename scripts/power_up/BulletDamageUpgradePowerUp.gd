extends PowerUp

@export var powerful_player_bullet:PackedScene


@export var powerup_duration:float=2

func apply(player:CharacterBody2D):
	$CollisionShape2D.set_deferred("disabled",true)
	var previous_bullet_scenes:Array[PackedScene]
	for child in player.get_children(false):
		if child is Spawner and "Shooter" in child.name:
			previous_bullet_scenes.append(child.object_scene)
			child.object_scene = powerful_player_bullet
	await get_tree().create_timer(powerup_duration).timeout
	
	if player != null:
		var i:int=0
		for child in player.get_children(false):
			if child is Spawner and "Shooter" in child.name:
				child.object_scene = previous_bullet_scenes[i]
				i+=1
	successful.emit()


