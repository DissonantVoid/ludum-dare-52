extends Node2D

const _asteroide_scene : PackedScene = preload("res://game/objects/asteroide.tscn")

const _bullet_manager : PackedScene = preload("res://game/Bulletmanager.tscn")
onready var _asteroides_container : Node2D = $Asteroides
onready var _player : Node2D = $PlayerShip

const _start_asteroides : int = 12
const _max_asteroide_distance : float = 1100.0 # respawn after they get this far from player
const _astroides_spawn_distance : float = 800.0
const _asteroide_min_speed : float = 25.0
const _asteroide_max_speed : float = 80.0

var _rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	_rng.randomize()
	var bullet_manager = _bullet_manager.instance()
	Signalbus.connect("bullet_fired", bullet_manager, "add_bullet")
	add_child(bullet_manager)
	for i in _start_asteroides:
		_spawn_asteroide()

func _process(delta: float) -> void:
	pass

func _spawn_asteroide():
	var instance := _asteroide_scene.instance()
	instance.connect("tree_exited", self, "_on_asteroide_destroyed")
	
	_asteroides_container.add_child(instance)
	instance.global_position =\
		_player.global_position + Vector2(_astroides_spawn_distance, 0).rotated(_rng.randf_range(0,TAU))
	instance.setup(
		Vector2(1,0).rotated(_rng.randf_range(0,TAU)),
		_rng.randf_range(1, 2),
		_rng.randf_range(_asteroide_min_speed, _asteroide_max_speed)
	)

func _on_asteroide_destroyed():
	_spawn_asteroide()

func _on_asteroids_detection_timeout() -> void:
	# in order to save performance we don't check this every frame
	for child in _asteroides_container.get_children():
		if child is Timer: continue
		
		# bring in asteroides that are too far away
		var distance_to_player : float =\
			child.global_position.distance_to(_player.global_position)
		
		if distance_to_player > _max_asteroide_distance:
			child.global_position =\
				_player.global_position + Vector2(_astroides_spawn_distance, 0).rotated(_rng.randf_range(0,TAU))
