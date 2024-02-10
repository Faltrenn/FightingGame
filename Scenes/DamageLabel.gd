class_name DamageLabel extends Label


func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(queue_free)
