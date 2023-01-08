extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500
var accelerate = 2000
onready var weapon = get_node("Roller")
#I don't know why I have to do this. I just do.
func _ready():
	weapon.rotation_degrees = -90

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * speed, accelerate * delta)
	
	look_at(get_global_mouse_position())
	# the subtraction caused an error and I wasn't sure what it was meant to be doing
	
	velocity = move_and_slide(velocity, Vector2.ZERO)
	
	if Input.is_action_pressed("mouse_left"):
		weapon.extend_weapon()
	else:
		weapon.retract_weapon()
