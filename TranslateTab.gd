extends Tabs

onready var glyphSrc = preload("res://Glyph2.tscn")

var scale = 0.2

func _ready():
	for glyph in DATA.baseGlyphs:
		var glyphObj = glyphSrc.instance()
		glyphObj.set_glyph(glyph)
		glyphObj.set_mode(2)
		glyphObj.enable_right_clicks()
		glyphObj.rect_min_size = Vector2(531,745) * scale
		glyphObj.connect("append_glyph", self, "append_glyph")
		if glyph.type == Glyph.Type.INNER:
			$"VBoxContainer/Inner Glyphs/HBoxContainer".add_child(glyphObj)
		elif glyph.type == Glyph.Type.OUTER:
			$"VBoxContainer/Outer Glyphs/HBoxContainer".add_child(glyphObj)


func add_new_glyph(glyph = null):
	var glyphObj = glyphSrc.instance()
	glyphObj.set_mode(0)
	if glyph != null:
		glyphObj.set_glyph(glyph)
	$"VBoxContainer/HBoxContainer2/Glyph Editor/HBoxContainer".add_child(glyphObj)
	
func append_glyph(glyph: Glyph):
	
	var mostRecentGlyph = $"VBoxContainer/HBoxContainer2/Glyph Editor/HBoxContainer".get_children().back()
	if mostRecentGlyph == null: add_new_glyph(glyph)
	elif glyph.type == glyph.Type.INNER and mostRecentGlyph.innerGlyph == null: mostRecentGlyph.set_glyph(glyph)
	elif glyph.type == glyph.Type.OUTER and mostRecentGlyph.outerGlyph == null: mostRecentGlyph.set_glyph(glyph)
	else: add_new_glyph(glyph)
