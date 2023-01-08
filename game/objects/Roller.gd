extends Node2D

signal rolled

enum FlickState{EXTENDED, RETRACTED}
var state = FlickState.RETRACTED

func extend_weapon():
	if state == FlickState.RETRACTED:
		$AnimationPlayer.play("Retract")
		state = FlickState.RETRACTED

func retract_weapon():
	if state == FlickState.EXTENDED:
		$AnimationPlayer.play("Flick")
		state = FlickState.RETRACTED

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
		body.attack_enemy(self)


func _on_AnimationPlayer_animation_finished(anim_name):
	if state == FlickState.FLICKING:
		state = FlickState.EXTENDED
	elif state == FlickState.RETRACT:
		state = FlickState.NEUTRAL
