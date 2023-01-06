extends Control

onready var _credits_panel : PanelContainer = $Credits

func _on_start_pressed():
	#SceneManager.change_scene("...")
	pass

func _on_tutorial_pressed():
	pass

func _on_credits_pressed():
	_credits_panel.show()

func _on_close_credits_pressed():
	_credits_panel.hide()
