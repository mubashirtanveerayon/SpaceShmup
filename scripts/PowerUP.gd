extends Area2D
class_name PowerUp
@export var speed:int = 30
signal successful
func _ready():
	body_entered.connect(on_body_entered)
	successful.connect(finish)

func _physics_process(delta):
	global_position.y += speed * delta

func finish():
	if $AudioStreamPlayer2D.playing:
		await $AudioStreamPlayer2D.finished
	queue_free()

func on_body_entered(body)->void:
	disable_movement()
	call_deferred("apply",body)
	$AnimatedSprite2D.hide()
	$AudioStreamPlayer2D.play()
	
func apply(player):
	
	
	successful.emit()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func disable_movement():
	set_physics_process(false)
	set_process(false)
	
