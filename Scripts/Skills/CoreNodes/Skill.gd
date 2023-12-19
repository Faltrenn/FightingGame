extends Node2D
class_name Skill

var in_cooldown = false
var cooldown: float
var timer: Timer = Timer.new()

func init(p_cooldown: float):
	cooldown = p_cooldown

func _init():
	add_child(timer)
	timer.one_shot = true
	timer.wait_time = cooldown
	timer.connect("timeout", func (): in_cooldown = false)

func execute(_p_player: Player):
	in_cooldown = true
	timer.start()
