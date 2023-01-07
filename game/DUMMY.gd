extends Node2D

# this is a dummy player for testing untill Dracuwump
# pushes his player object to github

var _speed : float = 120

func _physics_process(delta):
	var direction : Vector2
	
	if Input.is_key_pressed(KEY_UP):
		direction.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		direction.y += 1
	if Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1
	
	global_position += _speed * direction * delta
