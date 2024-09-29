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
