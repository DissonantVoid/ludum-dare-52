extends Control

signal out_of_fuel()

var cur_fuel := 100
# Called when the node enters the scene tree for the first time.
func _ready():
	Signalbus.connect("player_hit", self, "lose_fuel")

func refuel(fuel_amt):
	cur_fuel = clamp(cur_fuel + fuel_amt, 1, 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
"""func _process(delta):
	cur_fuel -= .00001
	$ProgressBar.value = cur_fuel
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")
"""

func lose_fuel():#_fuel_amt
	print("I noticed you got hurt there")
	cur_fuel -= 20
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")

func _on_Timer_timeout():
	cur_fuel -= 10
	$ProgressBar.value = cur_fuel
	if cur_fuel <= 0:
		emit_signal("out_of_fuel")
