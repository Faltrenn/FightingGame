class_name SomeSkill extends Skill


func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		player.add_effect(FireShield.new())
		super.execute()
