extends State

class_name WalkState

var friction = 0.003

func _physics_process(_delta):
	persistent_state.player.velocity.x *= friction
	if (persistent_state.getLatest(1)[0].stickPosition == 5):
		change_state.call("idle")

func move_forward():
	#print("continuing to move forwards")
	persistent_state.player.velocity += Vector2(1, 0) * persistent_state.forwardWalkSpeed * persistent_state.direction

# While we are moving backwards, set our velocity back to 0, then change to the backwalk state. 
func move_backwards():
	persistent_state.player.velocity.x = 0
	change_state.call("backwalk")
