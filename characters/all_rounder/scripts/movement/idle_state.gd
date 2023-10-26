extends State

# State created for a player doing nothing.
# implemented from Godot Docs
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
class_name IdleState

func _ready():
	persistent_state.correct_direction(persistent_state.player.position.x - persistent_state.opponent.position.x)
	persistent_state.player.velocity.x = 0
	pass # TODO: make an idle animation for the character and call it to play here

# When moving toward the opponent, change state to a walk
func move_forward():
	change_state.call("walk")
func run():
	change_state.call("run")
# When moving away from the opponent, change state to a backwalk (blocking!)
func move_backwards():
	change_state.call("backwalk")

func neutral_jump():
	change_state.call("neutraljump")

func forward_jump():
	change_state.call("forwardjump")
func backward_jump():
	change_state.call("backwardjump")
