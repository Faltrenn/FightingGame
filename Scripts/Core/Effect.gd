class_name Effect extends Node


var timer : TickTimer

func _init(ticks: int = 0, tick_time: float = 0, insta := false):
	if ticks != 0 and tick_time != 0:
		timer = TickTimer.new(ticks, tick_time, insta)
		add_child(timer)
		timer.tick.connect(tick)
	ready.connect(start)

func start():
	pass

func tick():
	print("tick")

func end():
	pass
