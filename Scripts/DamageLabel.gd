extends Label

const TIME = 2

var timer: float = 0

func _process(delta):
	timer += delta
	if timer >= TIME:
		queue_free()
