extends Node2D

# Using the Godot Docs implementation of a state pattern, using static states
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
class_name State

var change_state
var animated_sprite
var persistent_state
var velocity = 0
var direction = "right"

# Default physics implementation that simply moves the player based on velocity
# Not functional, move and slide is not defined.
#func _physics_process(delta):
	#persistent_state.move_and_slide(persistent_state.velocity, vector2.UP)

# Allows the FSM to reference itself to change states.
func setup(change_state_, animated_sprite_, persistent_state_):
	self.change_state = change_state_
	self.animated_sprite = animated_sprite_
	self.persistent_state = persistent_state_

# Unimplemented movement functions. forward and backward are both relevant to the location of player 2.
func move_forward():
	pass
func move_backwards():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
