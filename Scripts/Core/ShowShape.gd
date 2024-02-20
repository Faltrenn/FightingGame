class_name ShowShape extends Node2D


var timer := Timer.new()
var shape : Shape2D
var color : Color

func _init(p_shape: Shape2D, hitted: bool, timeout: float = .2):
	shape = p_shape.duplicate()
	color = Color.RED if hitted else Color(.0, .6, .7, .5)
	add_child(timer)
	timer.wait_time = timeout
	timer.timeout.connect(queue_free)
	timer.autostart = true

func _draw():
	shape.draw(get_canvas_item(), color)
