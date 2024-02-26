class_name Effect extends Node


var entity : Entity

var tick_timer : TickTimer
var timer : Timer
var stacks := 0

func _ready():
	entity = get_parent().get_parent()
	_start()


func _set_tick_timer(ticks: int, tick_time: float):
	tick_timer = TickTimer.new(ticks, tick_time)
	add_child(tick_timer)
	tick_timer.tick.connect(_tick)
	tick_timer.end.connect(_end)

func _set_timer(time: float):
	timer = Timer.new()
	timer.wait_time = time
	timer.one_shot = true
	timer.autostart = true
	timer.timeout.connect(_end)
	add_child(timer)

func _start():
	pass

func _tick():
	pass

func _end():
	queue_free()
