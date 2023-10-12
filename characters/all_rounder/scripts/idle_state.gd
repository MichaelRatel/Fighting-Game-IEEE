extends State

# State created for a player doing nothing.
# implemented from Godot Docs
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
class_name IdleState

func _ready():
	pass # TODO: make an idle animation for the character and call it to play here

# When moving toward the opponent, change state to a walk
func move_forward():
	change_state.call("walk")

# When moving away from the opponent, change state to a backwalk (blocking!)
func move_backwards():
	change_state.call("backwalk")
