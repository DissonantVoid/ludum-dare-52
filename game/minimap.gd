extends MarginContainer

onready var _icons_container : Control = $PanelContainer/IconsContainer
onready var _player : Node2D = $"../../PlayerShip"

var _icons : Dictionary # { node : its icon }
const _zoom_factor : float = 0.02

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("show_in_minimap"):
		var icon : ColorRect = ColorRect.new()
		icon.rect_min_size = Vector2.ONE * 5
		icon.size_flags_horizontal = 0
		icon.size_flags_vertical = 0
		if node is preload("res://game/objects/player_star.gd"):
			icon.color = Color.green
		elif node is preload("res://game/objects/enemy_star.gd"):
			icon.color = Color.red
		elif node is preload("res://game/Actors/PlayerShip.gd"):
			icon.color = Color.orange
		
		_icons_container.add_child(icon)
		_icons[node] = icon

func _process(delta: float) -> void:
	for node in _icons.keys():
		var icon : ColorRect = _icons[node]
		var distance_from_player : Vector2 = node.global_position - _player.global_position
		icon.rect_position = distance_from_player * _zoom_factor
