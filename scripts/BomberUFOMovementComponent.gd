extends MovementComponent



func _ready():
	normalized_dir=Vector2.DOWN


func _on_visible_on_screen_notifier_2d_screen_exited():
	if global_position.y > 0:
		owner.global_position.y = -50
