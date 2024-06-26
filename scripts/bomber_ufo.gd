extends "res://scripts/enemy.gd"

@export var bomb_spawn_frequeny_min:float=2.5
@export var bomb_spawn_frequeny_max:float=4

func _ready()->void:
	super._ready()
	$Spawner.spawn_interval = randf_range(bomb_spawn_frequeny_min,bomb_spawn_frequeny_max)
func _process(delta)->void:
	$Spawner.enabled = $HealthSystem.is_visible
