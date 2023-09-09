extends CharacterBody2D

var persistantState : Node2D

#All and all I hate this, I can't think of anything better right now
#I'd love for it to be one file for input handling for both players though
#since it'd make the special move detection probably easier to write, and DRY
#principles of course/ But this will get very messy
var leftString
var rightString

#Player 1 is a and d atm, player 2 is left and right
func _ready():
	if(name == "Player1"):
		persistantState = get_node("Player1State")
		leftString = "player1_left"
		rightString = "player1_right"
	else:
		persistantState = get_node("Player2State")		
		leftString = "player2_left"
		rightString = "player2_right"

#The extra if checks here make it so you can hold left or right cross screen
#and it will probably go into the walk backwards
func _process(_delta):
	if Input.is_action_pressed(leftString):
		if(persistantState.direction == persistantState.directions.LEFT):
			persistantState.move_forward()
		elif(persistantState.direction == persistantState.directions.RIGHT):
			persistantState.move_backwards()
	elif Input.is_action_pressed(rightString):
		if(persistantState.direction == persistantState.directions.RIGHT):
			persistantState.move_forward()
		elif(persistantState.direction == persistantState.directions.LEFT):
			persistantState.move_backwards()
	#So this could be a good way to reset state, instead of checking physics
	#values. BUT the way our state machine works is it dynamically creates a new
	#state object every time change_state is called, this makes it harder for me
	#at least to compare the current state to the wanted new state so we can
	#avoid making new state changes every frame. But I can't find a way to do it
	#that makes me happy.
#	else:
#		persistantState.change_state("idle")
