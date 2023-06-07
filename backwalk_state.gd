extends State

class_name BackwalkState

var move_speed = Vector2(180, 0)
var min_move_speed = 0.005
var friction = 0.32

# While entering a backwards walking state, do this:
func _ready():
	# play a backwards walking animation
	#animated_sprite.play("backwalk")
	# Flip our velocity based on direction of the player node
	if direction == "left":
		move_speed.x *= -1
	# add our speed to the velocity of the player
	persistent_state.velocity += move_speed

# While grounded, apply force of friction
func _physics_process(_delta):
	# If our velocity drops below the minimum, go back into an idle state.
	if abs(persistent_state.velocity.x) < min_move_speed:
		change_state.call("idle")
	# After checking, apply force of friction
	persistent_state.velocity.x *= friction
	
# while we are moving forwards, set our velocity back to 0, then change to the walking state
func move_forwards():
	persistent_state.velocity.x = 0
	change_state.call("walk")

# While we are moving backwards, keep moving backwards.
func move_backwards():
	#print("Moving back!")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print("in backwalk state")
	pass
