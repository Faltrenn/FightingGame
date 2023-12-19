class_name Effect
extends Node2D

var duration: float
var delta_tick: float
var ticks: int
var player: Player

var timer = Timer.new()

func _init():
	add_child(timer)
	timer.connect("timeout", tick)
	print("opa")

func init(p_duration: float, p_ticks: int, insta: bool, p_player: Player):
	duration = p_duration
	ticks = p_ticks
	player = p_player
	if insta:
		tick()
	timer.wait_time = p_duration/p_ticks
	timer.start()
	print("epa")

func tick():
	ticks -= 1
	if ticks == -1:
		end()
		queue_free()

func end(): pass
