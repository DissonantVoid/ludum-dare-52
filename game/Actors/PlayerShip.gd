extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500
var accelerate = 2000
onready var weapon = get_node("Roller")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	input_vector = input_vector.normalized()
	
	look_at(get_global_mouse_position())
	
	velocity = velocity.move_toward(input_vector * speed, accelerate * delta)
	velocity = move_and_slide(velocity, Vector2.ZERO)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		weapon.toggle_weapon()
		Signalbus.emit_signal("bullet_fired", self)
