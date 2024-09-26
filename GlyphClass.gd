extends Node
class_name Glyph

enum Type {INNER, OUTER}

var texture: StreamTexture
var sound: Sound
var type: int


func _init(initTexture, initType, initSound = Sound.new("?")):
	texture = initTexture
	sound = initSound
	type = initType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
