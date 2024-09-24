extends Control

var dragging = false

func _ready():
	DATA.load_file()

func show_glyphs():
	for i in range(0,$"VBoxContainer/Glyph Count".count):
		$Glyphs.get_child(i).visible = true
	for i in range($"VBoxContainer/Glyph Count".count, 8):
		$Glyphs.get_child(i).visible = false
		$Glyphs.get_child(i).reset()

func _process(_delta):
	
	#TODO: Glyphs can do their own phenome/syllable lookup, Sphennec root
	#should only attempt to translate the entire collection
	#using the values from all visible glyphs
	
	show_glyphs()
	
	# Attempt to lookup a known word using all visible glyphs decimal values
	var translation = DATA.get_translation(get_all_glyph_dec())
	if translation != "?":
		$Label.text = "Identified: " + translation
		return
		
	$Label.text = "Partial translation: " + get_glyph_translations()
		 
func save_file():
	DATA.save_file()

func load_file():
	DATA.load_file()

func save_translation():
	var value = $Data/HBoxContainer2/LineEdit.text
	var key = get_all_glyph_dec()
	DATA.set_translation(key, value)
		
func get_all_glyph_dec():
	var dec = ""
	for glyph in $Glyphs.get_children():
		if glyph.visible == false:
			return dec.substr(1)
		dec = dec + " " + str(glyph.decimal)
		
func get_glyph_translations():
	var translation = ""
	for glyph in $Glyphs.get_children():
		if glyph.visible == false:
			return translation.substr(1)
		translation = translation + " " + glyph.label.text

func reset_glyphs():
	$"VBoxContainer/Glyph Count".count = 1
	for glyph in $Glyphs.get_children():
		glyph.reset()
