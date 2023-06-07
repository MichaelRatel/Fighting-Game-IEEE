extends State


func _input(event):
	if event.is_action_pressed("player1_left"):
		move_backwards()
	if event.is_action_pressed("player1_right"):
		move_forward()
