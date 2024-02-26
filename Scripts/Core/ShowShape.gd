class_name ShowShape extends Node2D


var timer : Timer
var shape : Shape2D

func _init(p_shape: Shape2D):
	shape = p_shape.duplicate()

func set_timer(timeout: float = .2):
	timer = Timer.new()
	timer.wait_time = timeout
	timer.autostart = true
	timer.timeout.connect(queue_free)
	add_child(timer)

func _draw():
	shape.draw(get_canvas_item(), Color(.0, .6, .7, .5))
