class_name HotSpeed extends Effect


const SPEED := 300.0
const DURATION := 2.5

func _start():
	entity.speed += SPEED
	_set_timer(DURATION)

func _end():
	entity.speed -= SPEED
	queue_free()
