extends Node2D

signal rolled

enum FlickState{NEUTRAL, FLICKING, EXTENDED, RETRACT}
var state = FlickState.NEUTRAL
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func extend_weapon():
	match state:
		FlickState.NEUTRAL:
			$AnimationPlayer.play("Flick")
			state = FlickState.FLICKING

func retract_weapon():
	match state:
		FlickState.EXTENDED:
			$AnimationPlayer.play("Retract")
			state = FlickState.RETRACT


func _on_Area2D_body_entered(body):
	emit_signal("rolled", body)
	#What the fuck do I need to be doing?
	print("I recognize the hit.")
	print(body.get_groups())
	if body.is_in_group("Resource"):
		print("this is a resource.")
		body.harvest()
	elif body.is_in_group("Enemy"):
		print("This is an enemy")
		body.destroy_enemy()
