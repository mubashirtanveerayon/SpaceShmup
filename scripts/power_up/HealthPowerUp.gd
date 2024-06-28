extends PowerUp

@export var health_bonus:int = 200

func _ready():
	super._ready()
	$Label.text=str(health_bonus)
	$Label.hide()
func apply(player:CharacterBody2D):
	var player_health :HealthSystem= player.get_node("HealthSystem")
	if player_health != null and not player_health.is_destroyed:
		player_health.health += health_bonus
	$AnimationPlayer.play("health_upgrade")
	await $AnimationPlayer.animation_finished
	successful.emit()

func move_toward_health_bar():
	get_tree().create_tween().tween_property(self,"global_position",Vector2.ZERO,0.3)
