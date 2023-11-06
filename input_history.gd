extends RichTextLabel

var persistentState : Node2D

var last_input : String
var current_input : String
var input_array : Array 
var count = 1 # counts the number of frames the input was held
var current_keycode
var timer = 1 #counts the number of frames for the text to disappear
var isReady = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	persistentState = get_node("../")
	print(persistentState)
	self.text="ready"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(1 == isReady):
		current_input = persistentState.buffer.slice(-1)[0].toString()
	#yet to differentiate which player responds to which key
	if(isReady == 1): # if we have an input
		if last_input != current_input:
			input_array.append(current_input + "\n")
			last_input = current_input
			count = 1
		else:
			count=count+1
			input_array.pop_back()
			input_array.append(current_input+"x"+str(count))
		self.text = " ".join(input_array)
		timer=1
	else:
		last_input = ""
		timer+=1
		if timer*delta > 2: # greater than 2 seconds
			isReady = 1
			self.text="ready"
			timer=1
			input_array=[]
			


