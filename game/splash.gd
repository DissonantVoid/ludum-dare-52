extends Node2D


func _on_animation_finished(anim_name):
	# change scene to something else HERE
	queue_free()
