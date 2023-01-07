extends KinematicBody2D


class_name EnemyShip

var target
onready var weapon = get_node("Position2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	shoot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func destroy_enemy():
	queue_free()

func shoot():
	Signalbus.emit_signal("bullet_fired", self)
