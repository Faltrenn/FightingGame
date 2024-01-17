class_name Skill extends Node2D


var in_cooldown = false
var cooldown: float
var timer: Timer = Timer.new()
var player: Player

func init(p_cooldown: float):
	cooldown = p_cooldown

func _init():
	player = get_parent()
	add_child(timer)
	timer.one_shot = true
	timer.wait_time = cooldown
	timer.connect("timeout", func (): in_cooldown = false)

func execute():
	in_cooldown = true
	timer.start()
