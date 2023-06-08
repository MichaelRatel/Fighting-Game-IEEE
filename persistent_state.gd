extends CharacterBody2D

class_name PersistentState

var state
var state_factory

#var velocity = Vector2()
func _physics_process(delta):
	move_and_slide()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	state_factory = StateFactory.new()
	
	change_state("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(state.get_class())
	#this is fine for now, i need to be able to move left and right for testing
	if Input.is_action_pressed("ui_left"):
		move_forward()
	elif Input.is_action_pressed("ui_right"):
		move_backwards()
	
	
	
func move_forward():
	state.move_forward()

func move_backwards():
	state.move_backwards()
	
func change_state(new_state_name):
	print("change_state has been called. ")
	if state != null:
		state.queue_free()
	#print(new_state_name)
	#print(state_factory.get_state(new_state_name).new())
	if(state_factory.get_state(new_state_name) == null):
		pass
	state = state_factory.get_state(new_state_name).new()
	# NOTE: GODOT DOCS ARE NOT UPDATED TO GODOT 4 CALLS, THE PURPOSE OF "funcref" IN THE DOCS IS NOW USED BY "Callable"
	state.setup(Callable(self, "change_state"), $SolPlaceholder, self)
	state.name = "current_state"
	add_child(state)
