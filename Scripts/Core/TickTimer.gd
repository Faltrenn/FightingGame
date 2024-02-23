class_name TickTimer extends Timer

signal end
signal tick

var ticks : int
var insta : bool

func _init(p_ticks: int, tick_time: float, p_insta := false, p_autostart := true):
	ticks = p_ticks
	insta = p_insta
	timeout.connect(_tick)
	wait_time = tick_time
	autostart = p_autostart

func _ready():
	if insta:
		_tick()

func _tick():
	ticks -= 1
	tick.emit()
	if ticks == 0:
		end.emit()
		queue_free()
