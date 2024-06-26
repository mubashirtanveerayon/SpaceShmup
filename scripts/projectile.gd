extends HealthSystem

var visible_for_once:bool=false



func _ready():
	super._ready()
	
	var screen_rect = get_viewport_rect().size
	
	visible_for_once = global_position.x > 0 and global_position.x < screen_rect.x and global_position.y > 0 and global_position.y < screen_rect.y



func destroy():
	disable()
	queue_free()




func _on_visible_on_screen_notifier_2d_screen_entered():
	visible_for_once=true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if visible_for_once:
		disable()
		queue_free()


func _on_area_entered(area):
	if area is HealthSystem:
		destroy()
