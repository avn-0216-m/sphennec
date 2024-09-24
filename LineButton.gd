extends Button

var dragging = false

func _ready():
	connect("mouse_entered", self, "mouse_entered")

func mouse_entered():
	if Input.is_physical_key_pressed(KEY_SPACE):
		pressed = !pressed
