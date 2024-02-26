class_name Effect extends Node


var entity : Entity

var timer : TickTimer
var stacks := 0

func _ready():
	entity = get_parent().get_parent()
	start()

func set_tick_timer(ticks: int, tick_time: float):
	timer = TickTimer.new(ticks, tick_time)
	add_child(timer)
	timer.tick.connect(tick)
	timer.end.connect(end)

func start():
	pass

func tick():
	pass

func end():
	pass
