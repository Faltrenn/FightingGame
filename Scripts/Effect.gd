class_name Effect
extends Node

var duration: float
var delta_tick: float
var ticks: int
var player: Player

var timer: float


func init(_duration: float, _ticks: int, _player: Player):
	duration = _duration
	ticks = _ticks
	delta_tick = _duration/_ticks
	player = _player

func tick(): pass

func _process(delta):
	timer += delta
	if timer >= delta_tick:
		timer = 0
		tick()
		ticks -= 1
		if ticks == 0:
			queue_free()
