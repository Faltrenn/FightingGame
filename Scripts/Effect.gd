class_name Effect
extends Node2D

var duration: float
var delta_tick: float
var ticks: int
var player: Player

var timer: float

func _init():
	set_process(true)

func init(_duration: float, _ticks: int, insta: bool, _player: Player):
	duration = _duration
	ticks = _ticks
	delta_tick = _duration/_ticks
	player = _player
	if insta:
		tick()

func tick():
	ticks -= 1

func end(): pass

func _process(delta):
	timer += delta
	if timer >= delta_tick:
		timer = 0
		tick()
		if ticks == -1:
			end()
			queue_free()
