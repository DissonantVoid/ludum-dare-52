extends KinematicBody2D


class_name EnemyShip

var target
onready var weapon = get_node("Position2D")
var velocity = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	shoot()

#var _getting_knocked = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		reflect = move_and_collide(reflect)
		velocity = velocity.move_toward(Vector2.ZERO, 90 * delta)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	
	#if _getting_knocked:
		#position += (impulse * 40)

func attack_enemy(weapon):
	var impulse = weapon.global_position.direction_to(self.get_global_position())
	print(impulse)
	
	#queue_free()

func shoot():
	Signalbus.emit_signal("bullet_fired", self)
