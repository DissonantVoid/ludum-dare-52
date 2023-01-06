extends Node2D

var _ignore_input : bool = false

func _on_animation_finished(anim_name):
	SceneManager.change_scene("res://game/UI/TitleScreen.tscn")

func _input(event):
	# allow user to skip
	if _ignore_input == false && (event is InputEventMouseButton || event is InputEventKey):
		SceneManager.change_scene("res://game/UI/TitleScreen.tscn")
		_ignore_input = true
