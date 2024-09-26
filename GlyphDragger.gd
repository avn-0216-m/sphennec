extends Button

var parent: AspectRatioContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_drag_data(_position):
	return parent.get_active_glyph()
	
func can_drop_data(_pos, _data):
	return parent.mode == parent.Mode.TRANSLATE

func drop_data(_pos, data):
	parent.set_glyph(data)
