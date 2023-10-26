extends Node2D

# Using the Godot Docs implementation of a state pattern, using static states
# https://docs.godotengine.org/en/3.2/tutorials/misc/state_design_pattern.html
class_name State

var max_fps = 60
var change_state
var animated_sprite
var persistent_state

# Default physics implementation that simply moves the player based on velocity
func _physics_process(delta):
	pass

# Allows the FSM to reference itself to change states.
func setup(change_state, animated_sprite, persistent_state):
	self.change_state = change_state
	self.animated_sprite = animated_sprite
	self.persistent_state = persistent_state

# Unimplemented movement functions. forward and backward are both relevant to the location of player 2.
func move_forward():
	pass
func run():
	pass
func move_backwards():
	pass
func check_movement_keys():
	pass
func neutral_jump():
	pass
func forward_jump():
	pass
func backward_jump():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
