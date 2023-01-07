extends MarginContainer

var _credits_block = preload("res://game/UI/CreditsScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var _credits_panel : PanelContainer = $MarginContainer2/Credits

const _credit_tween_time : float = 0.4

func _on_start_pressed():
	SceneManager.change_scene("res://game/main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credits_pressed():
	var _credits_screen = _credits_block.instance()
	add_child(_credits_screen)
    
func _on_credits_pressed():
	_credits_panel.show()
	var tween := get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(_credits_panel, "rect_position:x", 10.0, _credit_tween_time).from(_credits_panel.rect_size.x)

func _on_close_credits_pressed():
	var tween := get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(_credits_panel, "rect_position:x", _credits_panel.rect_size.x, _credit_tween_time)
	yield(tween, "finished")
	_credits_panel.hide()

