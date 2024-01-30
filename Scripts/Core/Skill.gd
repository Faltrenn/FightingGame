class_name Skill extends Node


signal on_execute()
signal on_skill_ready()

var cd_timer = Timer.new()

var cooldown: float

var player: Player

func _ready():
	add_child(cd_timer)
	cd_timer.wait_time = cooldown
	cd_timer.one_shot = true
	cd_timer.timeout.connect(func (): on_skill_ready.emit())

func execute():
	on_execute.emit()
