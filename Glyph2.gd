extends VBoxContainer

var innerGlyph: Glyph
var outerGlyph: Glyph

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func update():
	
	$ColorRect/Inner.modulate = DATA.glyphColor
	$ColorRect/Outer.modulate = DATA.glyphColor
	
	if outerGlyph != null:
		$ColorRect/Outer.texture = outerGlyph.texture
		$ColorRect/Popup/MarginContainer/VBoxContainer/Label.text = "Sound: " + outerGlyph.sound
		$Label.text = outerGlyph.sound
	if innerGlyph != null:
		$ColorRect/Inner.texture = innerGlyph.texture
		$ColorRect/Popup/MarginContainer/VBoxContainer/Label.text = "Sound: " + innerGlyph.sound
		$Label.text = innerGlyph.sound

func set_glyph(glyph: Glyph):
	if glyph.type == Glyph.Type.INNER:
		innerGlyph = glyph
	else:
		outerGlyph = glyph
	update()


func button_pressed():
	$ColorRect/Popup.popup(Rect2(get_viewport().get_mouse_position(), $ColorRect/Popup.rect_size))
