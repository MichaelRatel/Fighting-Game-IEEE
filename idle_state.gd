extends State

# State created for a player doing nothing.
# implemented from Godot Docs
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
class_name IdleState

#var changestate = Callable(PersistentState, "change_state")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # TODO: make an idle animation for the character and call it to play here

# Switches direction of player character
func _flip_direction():
	animated_sprite.flip_h = not animated_sprite.flip_h
	if(direction == "right"):
		direction = "left"
	else:
		direction = "right"

# When moving toward the opponent, change state to a walk
func move_forward():
	print("Moving forward!") 
	change_state.call("walk")

# When moving away from the opponent, change state to a backwalk (blocking!)
func move_backwards():
	change_state.call("backwalk")
	#print("Moving back!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print("in idle state")
	pass
