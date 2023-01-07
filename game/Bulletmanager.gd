extends Node2D

export (PackedScene) var _bullet
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_bullet(shooter):
	var bullet = _bullet.instance()
	bullet.bullet_owner = shooter
	bullet.global_position = shooter.get_global_position() #This now gets the angle from the center of the gun to the muzzle.
	
	print(bullet.global_position.direction_to(shooter.weapon.get_global_position()))
	bullet._direction = bullet.global_position.direction_to(shooter.weapon.get_global_position())
	add_child(bullet)
