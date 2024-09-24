extends Control

const EMPTY_GLYPH = "0000000000000"

enum GlyphType {
	EMPTY, # No lines selected
	INNER_PHENOME, # Only inner lines selected
	OUTER_PHENOME, # Only outer lines selected
	SYLLABLE # Inner and outer lines selected
	}

var type = GlyphType.EMPTY
var binary: String = ""
var decimal: int = 0
var iteration: int = 1
var syllable: String = ""
var outerPhoneme: String = ""
var innerPhoneme: String = ""
onready var label = get_node("Sound")

func get_binary(buttons: Array) -> String:
	var binary: String = ""
	for button in buttons:
		if button.pressed:
			binary = str(1) + binary
		else:
			binary = str(0) + binary
	return binary 

func reset():
	for button in $Inner.get_children() + $Outer.get_children() + [$Invert]:
		button.pressed = false

func _process(_delta):
	
	if not visible:
		return
	
	decimal = 0
	iteration = 1
	
	#0000000000000
	#foooooiiiiiii
	#f = flip, o = outer, i = inner

	binary = get_binary($Inner.get_children() + $Outer.get_children() + [$Invert])
		
	$Binary.text = binary
	decimal = DATA.bin_to_dec(binary)
	$Decimal.text = str(decimal)
	
	if binary == EMPTY_GLYPH:
		type = GlyphType.EMPTY
	elif binary == DATA.get_inner_byte(binary):
		type = GlyphType.INNER_PHENOME
	elif binary == DATA.get_outer_byte(binary):
		type = GlyphType.OUTER_PHENOME
	else:
		type = GlyphType.SYLLABLE
	
	match(type):
		GlyphType.EMPTY:
			label.text = "..."
		GlyphType.OUTER_PHENOME, GlyphType.INNER_PHENOME:
			label.text = DATA.get_bin_translation(DATA.unflip(binary))
		GlyphType.SYLLABLE:
			var translation = DATA.get_bin_translation(binary)
			if translation == "?":
				if DATA.is_flipped(binary):
					translation = DATA.get_bin_translation(DATA.get_outer_byte(binary)) + "-" + DATA.get_bin_translation(DATA.get_inner_byte(binary))
				else:
					translation = DATA.get_bin_translation(DATA.get_inner_byte(binary)) + "-" + DATA.get_bin_translation(DATA.get_outer_byte(binary))
			label.text = translation
