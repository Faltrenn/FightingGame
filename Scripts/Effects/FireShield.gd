class_name FireShield extends Effect


const SHIELD := 30
const DURATION := 2.5

func _start():
	entity.shield += SHIELD
	_set_timer(DURATION)

func _end():
	entity.shield -= SHIELD
	queue_free()
