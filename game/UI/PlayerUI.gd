extends Control

signal out_of_fuel()

var cur_fuel := 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func refuel(fuel_amt):
	cur_fuel = clamp(cur_fuel + fuel_amt, 1, 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
"""func _process(delta):
	cur_fuel -= .00001
	$ProgressBar.value = cur_fuel
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")
"""

func lose_fuel(fuel_amt):
	cur_fuel -= fuel_amt
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")

func _on_Timer_timeout():
	cur_fuel -= 1
	$ProgressBar.value = cur_fuel
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")
