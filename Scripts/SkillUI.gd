class_name SkillUI extends Node


@onready var cooldown = $Cooldown as ColorRect
@onready var time = $Cooldown/Time as Label

var skill: Skill:
	set(value):
		skill = value
		if value:
			skill.on_execute.connect(_start)
			skill.on_skill_ready.connect(_end)
			if time and cooldown:
				time.text = ""
				cooldown.visible = false
		else:
			if time and cooldown:
				time.text = ""
				cooldown.visible = true

func _ready():
	set_process(false)

func _start():
	cooldown.visible = true
	set_process(true)

func _end():
	cooldown.visible = false
	set_process(false)

func reset():
	if time and cooldown:
		time.text = ""
		cooldown.visible = true

func _process(_delta: float):
	time.text = "%.1f" % skill.timer.time_left
