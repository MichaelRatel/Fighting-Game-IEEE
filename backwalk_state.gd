extends State

class_name BackwalkState

var friction = 0.003

func _physics_process(_delta):
	persistent_state.player.velocity.x *= friction

# while we are moving forwards, set our velocity back to 0, then change to the walking state
func move_forward():
	persistent_state.player.velocity.x = 0
	change_state.call("walk")

# While we are moving backwards, keep moving backwards.
func move_backwards():
	print("continuing to move back")
	persistent_state.player.velocity += Vector2(1, 0) * persistent_state.backwardWalkSpeed * (-1 * persistent_state.direction)
