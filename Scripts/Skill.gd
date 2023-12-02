class_name Skill
extends Node

var in_cooldown = false
var cooldown: float
var timer: float = 0.0

func _ready():
	set_process(false)

func reset_cooldown(delta: float):
	timer += delta
	if timer >= cooldown:
		timer = 0
		in_cooldown = false
		set_process(false)

func _process(delta):
	reset_cooldown(delta)

func execute(_player: Player): pass
