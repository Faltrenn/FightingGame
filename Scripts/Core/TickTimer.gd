class_name TickTimer extends Timer

signal end
signal tick
signal last_tick

var ticks : int

func _init(p_ticks: int, tick_time: float, p_autostart := true):
	if p_ticks > 0 and tick_time > 0:
		ticks = p_ticks
		timeout.connect(_tick)
		wait_time = tick_time
		autostart = p_autostart
	else:
		push_error("Invalids ticks or tick_time on: ", name)
		queue_free()

func _tick():
	if ticks > 0:
		ticks -= 1
		tick.emit()
		if ticks == 0:
			last_tick.emit()
	else:
		end.emit()
		queue_free()
