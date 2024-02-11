class_name Skill extends Node


signal on_execute()
signal on_skill_ready()

var timer := Timer.new()

var cooldown: float

var player: Player

func _ready():
	add_child(timer)
	timer.wait_time = cooldown
	timer.one_shot = true
	timer.timeout.connect(func (): on_skill_ready.emit())

func execute():
	timer.start()
	on_execute.emit()
