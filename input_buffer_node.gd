extends Node2D
class_name InputFrame
var stickPosition = 1
var aPress = false
var bPress = false
var cPress = false
var dPress = false
# Called when adding to the inputBuffer
# Currently only tracks the stick position
func set_values():
	stickPosition = 5 # if there are no inputs, set state to 5 (neutral)
	if(Input.is_action_pressed("player1_left")):
		stickPosition -= 1
	if(Input.is_action_pressed("player1_right")):
		stickPosition += 1
	if(Input.is_action_pressed("player1_up")):
		stickPosition += 3
	if(Input.is_action_pressed("player1_down")):
		stickPosition -= 3


