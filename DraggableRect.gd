extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_drag_data(_position):
	print("Getting drag data.")
	return "beep"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(get_drag_data())
