extends State

class_name WalkState

var move_speed = Vector2(180, 0)
var min_move_speed = 0.005
var friction = 0.32

# While in a walking state, do this:
func _ready():
	# play a walking animation
	#animated_sprite.play("walk")
	# Flip our velocity based on direction of the player node
	if direction == "left":
		move_speed.x *= -1
	# add our speed to the velocity of the player
	persistent_state.velocity += move_speed

# While grounded, apply force of friction
func _physics_process(_delta):
	# If our velocity drops below the minimum, go back into an idle state.
	if abs(persistent_state.velocity.x) < min_move_speed:
		print("Too Slow!")
		change_state.call("idle")
	# After checking, apply force of friction
	persistent_state.velocity.x *= friction
	
# while we are moving forwards, retain movement speed
func move_forwards():
	pass

# While we are moving backwards, set our velocity back to 0, then change to the backwalk state. 
func move_backwards():
	persistent_state.velocity.x = 0
	change_state.call("backwalk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# add our speed to the velocity of the player
	persistent_state.velocity += move_speed
	print(persistent_state.velocity)
	pass
