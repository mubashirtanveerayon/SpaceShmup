extends Control

var score:int = 0
var enemy_types_destroyed:Array
var player_health:HealthSystem

signal boss_enemy_dead

func _ready():
	for i in range(4):
		enemy_types_destroyed.append(0)
	var world_node = get_tree().get_first_node_in_group("world")
	await world_node.ready
	player_health=get_tree().get_first_node_in_group("player").get_node("HealthSystem")
	if player_health != null:
		$ProgressBar.max_value=player_health.health
		player_health.health_changed.connect(on_player_health_changed)
	for child in world_node.get_children(false):
		if "EnemySpawner" in child.name and child.has_signal("spawned_objects"):
			child.spawned_objects.connect(on_enemy_spawn)
		elif "Enemy" in child.name and child.unique_id==3:
			child.enemy_dead.connect(on_enemy_dead)
	update_ui()


func on_enemy_spawn(enemies:Array)->void:
	for enemy in enemies:
		enemy.enemy_dead.connect(on_enemy_dead)

func on_enemy_dead(enemy_uid:int,death_point:int)->void:
	score += death_point
	enemy_types_destroyed[enemy_uid] += 1
	if enemy_uid == 3:
		boss_enemy_dead.emit()
	update_ui()

func on_player_health_changed(_health):
	update_ui()

func update_ui()->void:
	if player_health == null:
		return
	$EnemiesKilledStats/BasicEnemy/Label.text = str(enemy_types_destroyed[0])
	$EnemiesKilledStats/ShooterEnemy/Label.text = str(enemy_types_destroyed[1])
	$EnemiesKilledStats/BomberUFO/Label.text = str(enemy_types_destroyed[2])
	$Score.text = str(score)
	
	$ProgressBar.value=player_health.health
