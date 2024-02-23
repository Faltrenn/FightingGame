class_name Effect extends Node


var timer : TickTimer

func _init(ticks: int = 0, tick_time: float = 0, insta := false):
	if ticks != 0 and tick_time != 0:
		timer = TickTimer.new(ticks - int(insta), tick_time)
		add_child(timer)
		timer.tick.connect(tick)
	ready.connect(start)

func start():
	pass

func tick():
	pass

func end():
	pass
