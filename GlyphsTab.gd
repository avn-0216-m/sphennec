extends Tabs

onready var glyphSrc = preload("res://Glyph2.tscn")

var scale = 0.32

func _ready():
	for glyph in DATA.baseGlyphs:
		var glyphObj = glyphSrc.instance()
		glyphObj.set_glyph(glyph)
		glyphObj.set_mode(1)
		glyphObj.rect_min_size = Vector2(531,745) * scale
		if glyph.type == Glyph.Type.INNER:
			$"VBoxContainer/ScrollContainer/Inner Glyphs".add_child(glyphObj)
		elif glyph.type == Glyph.Type.OUTER:
			$"VBoxContainer/ScrollContainer2/Outer Glyphs".add_child(glyphObj)
