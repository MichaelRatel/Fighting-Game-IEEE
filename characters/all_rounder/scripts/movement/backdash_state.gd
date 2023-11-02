extends State

class_name BackdashState

var n = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	persistent_state.player.velocity.x = 800 * persistent_state.direction * -1
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(n <= 20):
		n += 1;
		persistent_state.player.velocity.x += 20 * persistent_state.direction 
		return
	else:
		persistent_state.player.velocity.x = 0
		change_state.call("idle")
	return

func backdash():
	pass
