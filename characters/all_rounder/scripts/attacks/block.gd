extends State

# State created for a player blocking
class_name BlockState
var move_state : MovementState

func _ready():
	move_state = $"../../MovementState"
	pass

func _process(delta):
	if(move_state.currentState != "backwalk"):
		change_state.call("neutral")
