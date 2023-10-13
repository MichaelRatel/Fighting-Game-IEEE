
# State factory layout lifted from Godot documentation
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html

class_name StateFactory

var states

# Create definitions for each state. similar to enums. 
func _init():
	states = { 
		"idle": IdleState,
		"walk": WalkState,
		"backwalk": BackwalkState,
		"neutraljump": NeutralJumpState
	}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state", state_name, " in state factory!")
