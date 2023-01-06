extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500
var accelerate = 2000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * speed, accelerate * delta)
	#The position 2D needs to be pointed at the Mouse.
	#The entire body is being used as a pivot
	#So what math should be put to work on this?
	
	look_at(get_global_mouse_position() - $Position2D.position)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	if Input.is_action_just_pressed("mouse_left"):
		$AnimationPlayer.play("FlickWeapon")
