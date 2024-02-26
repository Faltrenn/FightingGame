class_name ShowShape extends Node2D


var timer : Timer
var shape : Shape2D
var color : Color

func _init(p_shape: Shape2D, hitbox: Hitbox):
	shape = p_shape.duplicate()
	color = Color(.0, .6, .7, .5) if hitbox.old_collision.is_empty() else Color.RED

func set_timer(timeout: float = .2):
	timer = Timer.new()
	timer.wait_time = timeout
	timer.autostart = true
	timer.timeout.connect(queue_free)
	add_child(timer)

func _draw():
	shape.draw(get_canvas_item(), color)
