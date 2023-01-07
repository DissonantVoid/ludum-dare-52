extends Area2D

onready var _anim_player : AnimationPlayer = $AnimationPlayer

var _direction : Vector2
var _speed : float

func setup(direction : Vector2, size : float, speed : float):
	_direction = direction
	_speed = speed
	scale = Vector2.ONE * size

func _physics_process(delta: float) -> void:
	global_position += _direction * _speed * delta

func _on_body_entered(body: Node) -> void:
	if (body is preload("res://game/objects/enemy_base.gd")):
		# or body is player
		body.take_damage()
		_anim_player.play("destroyed")

func _on_area_entered(area: Area2D) -> void:
	if area is get_script(): # another astroid
		_direction = -_direction # bounce

func _on_animation_finished(anim_name: String) -> void:
	queue_free()
