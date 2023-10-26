extends Node2D
class_name PersistentState

var state
var state_factory

#Probably move these somewhere else with the other character specific info
#for now it works. Allows the speed to be modified from the inspector
@export var forwardWalkSpeed : float = 360.0
@export var forwardRunSpeed : float = 720.0
@export var backwardWalkSpeed : float = 240.0
@export var gravity : float = 20
#not actually the jump height, its the velocity the jump first starts at, raising it increases the jump height. i dont have the courage to call it jump force
@export var jumpHeight : float = 800
#Allows us to get information on the opponent, just set through the inspector
#for now, should probably get a full constructor when characters are spawned in
#through code. Used now for direction flipping
@export var opponent : CharacterBody2D = null

var currentState: String = "IdleState"
#I ended up moving the state off of the top of the chain. I think this all makes
#sense, input informs the state, which then changes the sprite if needed. Which
#tracks with the new layout of the scene
var player : CharacterBody2D
var sprite : Sprite2D
var inputBuffer : Array
var inputNode : Node2D

enum directions {LEFT = -1, RIGHT = 1}
var direction : directions = directions.RIGHT

var shouldFlip : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	sprite = get_node("PlayerSprite")
	inputNode = get_node("InputFrame")
	
	if(player.name == "Player2"):
		direction = directions.LEFT
		shouldFlip = false
		inputNode.player = 2
	
	state_factory = StateFactory.new()
	
	if(direction == directions.RIGHT):
		sprite.set_flip_h(shouldFlip)
	
	# Creates new Input buffer to hold past 60 frames of inputs
	# new inputs go to the back of the array, and nodes at the front get popped
	inputBuffer.resize(60)
	change_state("idle")

#This all can be removed eventually but for now its needed.
#Honestly the movement included with the Godot state sample was awful
#Using a whole vector for speed? Weird since speed is a scalar value. It also
#had to be changed to allow for changes in direction with different walk speeds
#which it now does.
func _physics_process(_delta):
	player.move_and_slide()

#Checks the distance of the players every frame, if the sign of the distance
#swaps from positive to negative, or vis versa, then the direction of the
#players also swaps. 


func _process(_delta):
	var distance = player.position.x - opponent.position.x
	
	
	correct_direction(distance)
		
	# Writes a new node to the buffer every frame
	# Add newest input to end
	add_to_buffer()
	# Remove oldest input from front 
	var deadNode = inputBuffer.pop_front()
	# Free the oldest inputFrame
	# Since we initialize our array with null, we can't free null.
	if(deadNode != null):
		deadNode.free()
	
	
	
# Creates a new inputFrame, initializes it, and adds it to the buffer.
# Print is here for testing purposes, we WILL want to print it somewhere if we create a training mode.
func add_to_buffer():
	var newNode = InputFrame.new()
	if(player.name == "Player2"):
		newNode.player = 2
	newNode.set_values()
	if(direction == directions.LEFT):
		newNode.inverseDirection()
	#print(newNode.toString())
	inputBuffer.push_back((newNode))
	pass
	
# Creates a Substring of our input buffer, returning an array of the last num nodes in the buffer
# num: the number of nodes we want to check
# return: an array in chronological order of the last num nodes.
func getLatest(num) :
	return inputBuffer.slice(-num)

func move_forward():
	state.move_forward()
func run():
	state.run()
func move_backwards():
	state.move_backwards()

func neutral_jump():
	state.neutral_jump()
func forward_jump():
	state.forward_jump()
func backward_jump():
	state.backward_jump()

# Switches direction of player character
func _flip_direction():
	shouldFlip = not shouldFlip
	sprite.set_flip_h(shouldFlip)
	direction *= -1
	for node in inputBuffer:
		inputBuffer[inputBuffer.find(node)].inverseDirection() # flip directions
	

# corrects direction based on current state.
func correct_direction(distance):
	# when we are airborne, dont flip
	if(currentState == "forwardjump" || currentState == "backwardjump" || currentState == "neutraljump"):
		pass
	elif((direction == directions.LEFT && distance < 0 || direction == directions.RIGHT && distance > 0)):
		#print(currentState)
		
		_flip_direction()

func change_state(new_state_name):
	print("%s :change_state has been called with %s" % [get_parent().to_string(), new_state_name])
	if state != null:
		state.queue_free()
	if(state_factory.get_state(new_state_name) == null):
		pass
	state = state_factory.get_state(new_state_name).new()
	# NOTE: GODOT DOCS ARE NOT UPDATED TO GODOT 4 CALLS, THE PURPOSE OF "funcref" IN THE DOCS IS NOW USED BY "Callable"
	state.setup(Callable(self, "change_state"), get_node("PlayerSprite"), self)
	state.name = "current_state"
	currentState = new_state_name
	add_child(state)
