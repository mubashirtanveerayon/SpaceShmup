extends MovementComponent

signal direction_change_time_changed
@export var direction_change_timer:float=1:
	set(value):
		direction_change_timer = value
		direction_change_time_changed.emit()

var is_visible:bool=false

func _ready():
	normalized_dir.y = 1
	$Timer.wait_time = direction_change_timer
	$Timer.start()
	direction_change_time_changed.connect(_on_direction_change_time_changed)
	
func _on_direction_change_time_changed():
	$Timer.wait_time = direction_change_timer


func _on_timer_timeout():
	if not is_visible:
		return
	normalized_dir.x = randf_range(-1,1)
	normalized_dir.y = 1
	normalized_dir = normalized_dir.normalized()


func _on_visible_on_screen_notifier_2d_screen_entered():
	is_visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	is_visible = false
	normalized_dir.x = 1 if global_position.x < 0 else -1
	if global_position.y > 0:
		owner.global_position.y = -50
