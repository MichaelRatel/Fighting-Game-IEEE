extends State

class_name NeutralJumpState

# Called when the node enters the scene tree for the first time.
func _ready():
	persistent_state.player.velocity.y -= persistent_state.jumpHeight
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	persistent_state.player.move_and_slide()
	
	persistent_state.player.velocity.y += persistent_state.gravity
	if(persistent_state.player.position.y >= -140):
		persistent_state.player.velocity.y = 0
		persistent_state.player.position.y = -140
		change_state.call("idle")
	pass
