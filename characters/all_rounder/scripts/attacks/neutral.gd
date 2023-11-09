extends State

# State created for a player doing nothing.
# Specificially, its behavior relative to attacking and defending

class_name NeutralState
var move_state : MovementState

func _ready():
	move_state = $"../../Player1MovementState"
	pass
	
func _process(delta):
	if(move_state.currentState == "backwalk"):
		change_state.call("block")
	
