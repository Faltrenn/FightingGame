class_name SkillUI extends Node


@onready var cooldown = $Cooldown as ColorRect
@onready var time = $Cooldown/Time as Label

var skill: Skill

func _ready():
	set_process(false)
	if skill:
		skill.on_execute.connect(start)
		skill.on_skill_ready.connect(end)
	else:
		time.text = ""
		cooldown.visible = true

func start():
	cooldown.visible = true
	set_process(true)

func end():
	cooldown.visible = false
	set_process(false)

func _process(_delta: float):
	time.text = "%.1f" % skill.timer.time_left
