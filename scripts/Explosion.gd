extends Node2D

signal finished



@export_enum("heavy","instant","intense") var explosion_type=0

func play()->void:
	$CPUParticles2D.emitting=true
	$AnimatedSprite2D.play($AnimatedSprite2D.sprite_frames.get_animation_names()[explosion_type])
	$AudioStreamPlayer2D.play()

func _on_animated_sprite_2d_animation_finished():
	if not $AudioStreamPlayer2D.playing:
		finished.emit()


func _on_audio_stream_player_2d_finished():
	if not $AnimatedSprite2D.is_playing():
		finished.emit()


func _on_finished():
	$AnimatedSprite2D.frame=0
