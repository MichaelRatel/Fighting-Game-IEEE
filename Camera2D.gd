extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x = ($"../Player1".position.x + $"../Player2".position.x)/2
	position.y = ($"../Player1".position.y + $"../Player2".position.y)/3
	zoom = Vector2(1.4,1.4)-Vector2(abs(($"../Player1".position.x - $"../Player2".position.x))/2000,abs(($"../Player1".position.x - $"../Player2".position.x))/2000)
	if zoom>Vector2(1,1):
		zoom=Vector2(1,1)
	if zoom<Vector2(0.34,0.34):
		zoom=Vector2(0.34,0.34)
	offset.y = zoom.y*800 -850
