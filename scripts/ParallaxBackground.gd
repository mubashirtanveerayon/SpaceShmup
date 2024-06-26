extends ParallaxBackground

var player:CharacterBody2D=null
@export var speed:Vector2
func _ready()->void:
	await owner.ready
	player = get_tree().get_first_node_in_group("player")


func _process(delta:float)->void:
	if player == null:
		return
	$ParallaxLayer.motion_offset.x -= player.velocity.x * speed.x * delta
	$ParallaxLayer.motion_offset.y += speed.y * delta
