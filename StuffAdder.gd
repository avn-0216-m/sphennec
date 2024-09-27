extends TabContainer

var show_pos: Vector2 = Vector2(0, 260)
var hide_pos: Vector2 = Vector2(0, 540)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func mouse_entered():
	rect_position = show_pos


func mouse_exited():
	rect_position = hide_pos
