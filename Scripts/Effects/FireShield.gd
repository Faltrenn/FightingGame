class_name FireShield extends Effect


const SHIELD := 30
const DURATION := 2.5

func start():
	entity.shield += SHIELD
	var t = Timer.new()
	t.autostart = true
	t.wait_time = DURATION
	t.timeout.connect(end)
	add_child(t)

func tick():
	pass

func end():
	entity.shield -= SHIELD
	queue_free()
