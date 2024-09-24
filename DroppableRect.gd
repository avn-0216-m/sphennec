extends Control

func can_drop_data(position: Vector2, data) -> bool:
	print(data)
	return true

func drop_data(position: Vector2, data) -> void:
	print("dropped!")
