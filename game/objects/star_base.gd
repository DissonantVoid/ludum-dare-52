extends Node2D

onready var _sprite : ColorRect = $TEMP

const _rotation_speed : float = 30.0
var _health : float = 100

func _process(delta):
	_sprite.rect_rotation += _rotation_speed * delta
