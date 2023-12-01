class_name Skill
extends Node

var in_cooldown = false
var cooldown: float
var timer: float

func _ready():
	set_process(false)

func _process(delta):
	timer += delta
	if timer >= cooldown:
		in_cooldown = false
		set_process(false)

func execute(_player: Player): pass
