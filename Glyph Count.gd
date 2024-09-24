extends HBoxContainer

var count: int = 1


func _process(_delta):
	$Label.text = str(count)

func increase():
	count = min(6, count+1)

func decrease():
	count = max(1, count-1)
