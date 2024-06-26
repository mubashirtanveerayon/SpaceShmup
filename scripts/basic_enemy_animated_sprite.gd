extends AnimatedSprite2D

func _ready():
	var animation_names = sprite_frames.get_animation_names()
	play(animation_names[randi_range(0,animation_names.size()-1)])
