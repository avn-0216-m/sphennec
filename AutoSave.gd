extends CheckBox

var autosave: bool = true

func _ready():
	toggle(autosave)

func timer_done():
	print("Autosaving!")
	DATA.save_to_file()

func toggle(val: bool):
	if val:
		$Timer.start()
	else:
		$Timer.stop()
