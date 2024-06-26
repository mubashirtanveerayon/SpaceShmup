extends PowerUp


@export var invincible_duration:float = 1

func apply(player:CharacterBody2D):
	$CollisionShape2D.set_deferred("disabled",true)
	var player_health:HealthSystem = player.get_node("HealthSystem")
	if player_health != null:
		var sprite_node:Sprite2D=get_node("Sprite2D")
		remove_child(sprite_node)
		player.find_child("Visual",false).add_child(sprite_node)
		sprite_node.show()
		player_health.can_take_damage = false
		await get_tree().create_timer(invincible_duration).timeout
		if sprite_node != null:
			sprite_node.queue_free()
		if player_health != null:
			player_health.can_take_damage = true
	successful.emit()
