extends AspectRatioContainer

var innerGlyph: Glyph
var outerGlyph: Glyph
var flipped: bool = false
enum Mode {TRANSLATE, EDIT, ADD}
var mode
var original_size: Vector2
var grow_size: Vector2

signal append_glyph

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	original_size = rect_min_size
	grow_size = rect_min_size * 1.05
	$ColorRect.parent = self

func set_mode(newMode: int):
	mode = newMode

func update():
	
	# Set flip circle visibility
	$ColorRect/VBoxContainer/CenterContainer/FlipCircle.visible = flipped
	
	# Glyph line colour
	$ColorRect/VBoxContainer/Glyphs/.modulate = DATA.glyphColor
	$ColorRect/VBoxContainer/Glyphs/.modulate = DATA.glyphColor
	$ColorRect/VBoxContainer/CenterContainer/FlipCircle.modulate = DATA.glyphColor
	
	# Setting glyph information
	if outerGlyph != null:
		$ColorRect/VBoxContainer/Glyphs/Outer.texture = outerGlyph.texture
		$ColorRect/VBoxContainer/Label.text = outerGlyph.sound.text
		$ColorRect.hint_tooltip = "'" + outerGlyph.sound.text + "' like '" + outerGlyph.sound.example + "'"
	if innerGlyph != null:
		$ColorRect/VBoxContainer/Glyphs/Inner.texture = innerGlyph.texture
		$ColorRect/VBoxContainer/Label.text = innerGlyph.sound.text
		$ColorRect.hint_tooltip = "'" + innerGlyph.sound.text + "' like '" + innerGlyph.sound.example + "'"
	if outerGlyph != null and innerGlyph != null:
		$ColorRect.hint_tooltip = ""
		if not flipped:
			$ColorRect/VBoxContainer/Label.text = innerGlyph.sound.text + "-" + outerGlyph.sound.text
		else:
			$ColorRect/VBoxContainer/Label.text = outerGlyph.sound.text + "-" + innerGlyph.sound.text
	

func get_active_texture():
	if get_active_glyph() == null: return null
	return $ColorRect/VBoxContainer/Glyphs/Inner if get_active_glyph().type == Glyph.Type.INNER else $ColorRect/VBoxContainer/Glyphs/Outer

func get_active_glyph():
	if mode == Mode.TRANSLATE:
		print("no")
		return null
	if innerGlyph != null:
		return innerGlyph
	elif outerGlyph != null:
		return outerGlyph
	else:
		print("something fucked up")
		return null

func set_glyph(glyph: Glyph):
	if glyph.type == Glyph.Type.INNER:
		innerGlyph = glyph
	elif glyph.type == Glyph.Type.OUTER:
		outerGlyph = glyph
	else:
		print("AAAAAAAA")
	update()



		
func save_definition():
	var newSound = Sound.new($ColorRect/Popup/MarginContainer/VBoxContainer/HBoxContainer/SoundEntry.text)
	if $ColorRect/Popup/MarginContainer/VBoxContainer/ExampleEntry.text != "":
		newSound.example = $ColorRect/Popup/MarginContainer/VBoxContainer/ExampleEntry.text
	
	#Working under the assumption that editable glyphs only have an inner or an outer...
	get_active_glyph().sound = newSound
	$ColorRect/Popup.visible = false
	DATA.update_all()

func text_entry(new_text: String):
	save_definition()

#func mouse_entered():
#	if mode == Mode.EDIT or mode == Mode.ADD:
#		$Tween.interpolate_property(self, "rect_min_size", rect_min_size, grow_size, 0.5, Tween.TRANS_CUBIC)
#		$Tween.start()
#
#
#func mouse_exited():
#	if mode == Mode.EDIT or mode == Mode.ADD:
#		$Tween.interpolate_property(self, "rect_min_size", rect_min_size, original_size, 0.5, Tween.TRANS_CUBIC)
#		$Tween.start()


func gui_input(event):
	if mode != Mode.TRANSLATE: return
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		queue_free()
	# used to handle right clicks (to delete) only for translation mode
	
func enable_right_clicks():
	$ColorRect.button_mask = BUTTON_MASK_LEFT | BUTTON_MASK_RIGHT


func button_pressed():
	match mode:
		Mode.EDIT:
			$ColorRect/Popup.popup(Rect2(get_viewport().get_mouse_position(), $ColorRect/Popup.rect_size))
			yield(get_tree(), "idle_frame")
			$ColorRect/Popup/MarginContainer/VBoxContainer/HBoxContainer/SoundEntry.grab_focus()
		Mode.TRANSLATE:
			flipped = !flipped
			update()
		Mode.ADD:
			print("adding!")
			emit_signal("append_glyph", get_active_glyph())
