class_name Effect
extends Node2D

var duration: float
var delta_tick: float
var ticks: int
var player: Player

var timer: float

func _init():
	set_process(true)

func init(p_duration: float, p_ticks: int, insta: bool, p_player: Player):
	duration = p_duration
	ticks = p_ticks
	delta_tick = p_duration/p_ticks
	player = p_player
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
