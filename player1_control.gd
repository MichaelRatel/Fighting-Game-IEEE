extends State


func _input(event):
	if event.is_action_pressed("player1_left"):
		persistent_state.move_backwards()
	if event.is_action_pressed("player1_right"):
		persistent_state.move_forward()
