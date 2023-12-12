extends Node
class_name Skill

var in_cooldown = false
var cooldown: float
var timer: float = 0.0

var player: Player

func _init():
	set_process(true)

func reset_cooldown(delta: float):
	if in_cooldown:
		timer += delta
		if timer >= cooldown:
			timer = 0
			in_cooldown = false

func _process(delta):
	reset_cooldown(delta)

func execute(_player: Player): pass
