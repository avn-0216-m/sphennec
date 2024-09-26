extends Tabs
class_name SphennecTabs

onready var glyphSrc = preload("res://Glyph2.tscn")

func render_glyphs(innerList, outerList, mode):
	for glyph in DATA.baseGlyphs:
		var glyphObj = glyphSrc.instance()
		glyphObj.set_glyph(glyph)
		glyphObj.set_mode(mode)
		if glyph.type == Glyph.Type.INNER:
			get_node(innerList).add_child(glyphObj)
		elif glyph.type == Glyph.Type.OUTER:
			get_node(outerList).add_child(glyphObj)
