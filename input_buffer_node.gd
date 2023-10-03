extends Node2D
var persistentState : Node2D
var stickPosition = 1
var aPress = false
var bPress = false
var cPress = false
var dPress = false

# Called when the node enters the scene tree for the first time.
func _ready():
	stickPosition = 5 # if there are no inputs, set state to 5 (neutral)
	persistentState = get_node("Player1State")
	if(Input.is_action_pressed("player1_left")):
		stickPosition -= 1
	if(Input.is_action_pressed("player1_right")):
		stickPosition += 1
	if(Input.is_action_pressed("player1_up")):
		stickPosition += 3
	if(Input.is_action_pressed("player1_down")):
		stickPosition -= 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
