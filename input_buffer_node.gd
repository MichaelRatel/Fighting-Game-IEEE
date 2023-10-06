extends Node2D
class_name InputFrame
var stickPosition = 1
var aPress = false
var bPress = false
var cPress = false
var dPress = false
# Called when adding to the inputBuffer
# Currently only tracks the stick position
# Looking at it now this can be cleaned up with an enum reading from the input object but I am not worried about cleanliness rn
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
	if(Input.is_action_pressed("player1_a")):
		aPress = true
	if(Input.is_action_pressed("player1_b")):
		bPress = true
	if(Input.is_action_pressed("player1_c")):
		cPress = true
	if(Input.is_action_pressed("player1_d")):
		dPress = true

# Reverses the stick direction in the node. Flips horizontally (i.e, 4 becomes 6, 7 becomes 9)
# No return value
func inverseDirection():
	if(stickPosition == 1 || stickPosition == 4 || stickPosition == 7):
		stickPosition += 2
	if(stickPosition == 3 || stickPosition == 6 || stickPosition == 9):
		stickPosition -= 2

func toString():
	var string = ""
	string += str(stickPosition)
	if(aPress):
		string+='A'
	if(bPress):
		string+='B'
	if(cPress):
		string+='C'
	if(dPress):
		string+='D'
	return string
