extends CheckBox

var autosave: bool = true


func timer_done():
	print("Autosaving!")
	return
	DATA.save_file()

func toggle(val: bool):
	$Timer.paused = !val
