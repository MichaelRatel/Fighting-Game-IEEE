extends RichTextLabel

var persistentState : Node2D

var last_input : String
var current_input : String
var input_array : Array 
var count = 1 # counts the number of frames the input was held
var current_keycode
var timer = 1 #counts the number of frames for the text to disappear

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text="ready"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#yet to differentiate which player responds to which key
	if Input.is_anything_pressed() and current_input != "": #only if current input is a keyboard input
		if last_input != current_input:
			input_array.append(current_input)
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
			self.text="ready"
			timer=1
			input_array=[]
			
func _input(event):
	if event is InputEventKey:
		current_input=OS.get_keycode_string(event.keycode)
	else:
		current_input="" 

