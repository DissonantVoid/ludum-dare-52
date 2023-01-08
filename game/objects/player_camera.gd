extends Camera2D

onready var _player : Node2D = $"../PlayerShip"

var _player_last_pos : Vector2 = Vector2.ZERO
const _direction_offset : float = 80.0

func _physics_process(delta):
	var player_pos : Vector2 = _player.get_global_position()
	var direction : Vector2 = (player_pos - _player_last_pos).normalized()
	
	global_position = lerp(
		global_position, player_pos + direction * _direction_offset,
	0.1)
	
	_player_last_pos = player_pos
