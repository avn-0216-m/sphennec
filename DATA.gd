extends Node

var glyphColor = Color("000000")

var baseGlyphs: Array = [
	Glyph.new(preload("res://glyphs/Inner 1.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 2.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 3.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 4.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 5.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 6.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 7.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 8.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 9.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 10.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 11.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 12.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 13.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 14.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 15.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 16.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 17.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 18.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 19.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 20.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 21.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 22.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 23.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Inner 24.png"), Glyph.Type.INNER),
	Glyph.new(preload("res://glyphs/Outer 1.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 2.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 3.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 4.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 5.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 6.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 7.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 8.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 9.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 10.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 11.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 12.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 13.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 14.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 15.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 16.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 17.png"), Glyph.Type.OUTER),
	Glyph.new(preload("res://glyphs/Outer 18.png"), Glyph.Type.OUTER)
]

var words: Array = [
	
]

func _ready():
	load_from_file()
	
func load_from_file():
	print("Loaaaaded~")

#0000000000000
#foooooiiiiiii
#f = flip, o = outer, i = inner

# check if whole byte is the same as the inner OR the outer
# if it is, then the glyph is only representing one phenome and the flip value can be ignored

func update_all():
	for glyphCard in get_tree().get_nodes_in_group("Update"):
		glyphCard.update()

func set_translation(key, value):
	return

#func load_from_file():
#	print("Loading glyphs...")
#	var fh = File.new()
#	if not fh.file_exists("user://sphennec.dat"):
#		print("Creating new save file.")
#		save_to_file()
#	fh.open("user://sphennec.dat", File.READ)
#	baseGlyphs = JSON.parse(fh.get_line()).get_result()
#	fh.close()
#	print("Loaded:")
#	print(baseGlyphs)
	
func save_to_file():
	print("Saving glyphs...")
	print(baseGlyphs)
	var fh = File.new()
	fh.open("user://sphennec.dat", File.WRITE)
	fh.store_line(to_json(baseGlyphs))
	fh.close()
	print("Saved:")
	print(baseGlyphs)
	
#func get_bin_translation(bin):
#	return get_translation(bin_to_dec(bin))
#
#func get_translation(number):
#	var key = number
#	if typeof(key) == TYPE_INT:
#		key = str(key)
#	return glyphs.get(key, "?")
#
#func reverse_binary(bin):
#	var rev = ""
#	for bit in bin:
#		rev = bit + rev
#	return rev
#
#func bin_to_dec(bin):
#	var mult = 1
#	var dec = 0
#	for bit in reverse_binary(bin):
#		if bit == "1":
#			dec += mult
#		mult = mult * 2
#	return dec
