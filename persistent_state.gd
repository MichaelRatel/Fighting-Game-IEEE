extends RigidBody2D

class_name PersistentState

var state
var state_factory

var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	state_factory = StateFactory.new()
	change_state("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(Callable(self, "change_state"), $AnimatedSprite, self)
	state.name = "current_state"
	add_child(state)
