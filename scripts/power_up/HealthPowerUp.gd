extends PowerUp

@export var health_bonus:int = 200

func apply(player:CharacterBody2D):
	var player_health :HealthSystem= player.get_node("HealthSystem")
	if player_health != null and not player_health.is_destroyed:
		player_health.health += health_bonus
	successful.emit()
