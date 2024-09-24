extends Tabs

onready var glyphSrc = preload("res://Glyph2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for glyph in DATA.glyphs:
		print(glyph.sound)
		var glyphObj = glyphSrc.instance()
		glyphObj.set_glyph(glyph)
		if glyph.type == Glyph.Type.INNER:
			$"VBoxContainer/ScrollContainer/Inner Glyphs".add_child(glyphObj)
		elif glyph.type == Glyph.Type.OUTER:
			$"VBoxContainer/ScrollContainer2/Outer Glyphs".add_child(glyphObj)
