
# State factory layout lifted from Godot documentation
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html

class_name MovementStateFactory

var states

# Create definitions for each state. similar to enums. 
func _init():
	states = { 
		"idle": IdleState,
		"walk": WalkState,
		"run": RunState,
		"backwalk": BackwalkState,
		"backdash": BackdashState,
		"neutraljump": NeutralJumpState,
		"backwardjump": BackJumpState,
		"forwardjump": ForwardJumpState
	}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state", state_name, " in state factory!")
