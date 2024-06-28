extends PowerUp
@export var scale_multiplier:int=2


@export var powerup_duration:float=2

func apply(player:CharacterBody2D):
	$CollisionShape2D.set_deferred("disabled",true)
	
	for child in player.get_children(false):
		if child is Spawner and "Shooter" in child.name:
			child.spawned_objects.connect(on_player_shot_bullet)
	await get_tree().create_timer(powerup_duration).timeout
	successful.emit()

func on_player_shot_bullet(bullets:Array[Node2D]):
	for bullet in bullets:
		bullet.scale *= 2
