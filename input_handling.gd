extends CharacterBody2D

var persistentState : Node2D




#All and all I hate this, I can't think of anything better right now
#I'd love for it to be one file for input handling for both players though
#since it'd make the special move detection probably easier to write, and DRY
#principles of course/ But this will get very messy
var leftString
var rightString
var upString
var downString

#Player 1 is a and d atm, player 2 is left and right
func _ready():
	if(name == "Player1"):
		persistentState = get_node("Player1State")
		leftString = "player1_left"
		rightString = "player1_right"
		upString = "player1_up"
		downString = "player1_down"
	else:
		persistentState = get_node("Player2State")		
		leftString = "player2_left"
		rightString = "player2_right"
		upString = "player2_up"
		downString = "player2_down"

#The extra if checks here make it so you can hold left or right cross screen
#and it will probably go into the walk backwards






# This is great, but I think I can clean this up as soon as an input buffer is made,
# I'm not the most familiar with Godot, but this seems like a lot to get a character to move back and forth
# - Ratel
func _process(_delta):
	if Input.is_action_pressed(leftString):
		if(persistentState.direction == persistentState.directions.LEFT):
			persistentState.move_forward()
		elif(persistentState.direction == persistentState.directions.RIGHT):
			persistentState.move_backwards()
	elif Input.is_action_pressed(rightString):
		if(persistentState.direction == persistentState.directions.RIGHT):
			persistentState.move_forward()
		elif(persistentState.direction == persistentState.directions.LEFT):
			persistentState.move_backwards()
	#else:
		#persistentState.change_state("idle")
			
	#So this could be a good way to reset state, instead of checking physics
	#values. BUT the way our state machine works is it dynamically creates a new
	#state object every time change_state is called, this makes it harder for me
	#at least to compare the current state to the wanted new state so we can
	#avoid making new state changes every frame. But I can't find a way to do it
	#that makes me happy.
