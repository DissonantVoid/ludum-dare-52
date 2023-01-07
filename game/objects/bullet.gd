extends Area2D

var _speed : int = 400
var _direction = Vector2.ZERO 

var bullet_owner
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent())
	print(_direction)

func _physics_process(delta):
	position += _speed * delta * _direction
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bullet_body_entered(body):
	pass # Replace with function body.
