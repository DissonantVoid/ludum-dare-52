extends Control

var _credits_block = preload("res://game/UI/CreditsScreen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credits_pressed():
	var _credits_screen = _credits_block.instance()
	add_child(_credits_screen)
