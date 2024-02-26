class_name Char2Skill3 extends Skill


func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		player.add_effect(FireShield.new())
		player.add_effect(HotSpeed.new())
		super.execute()
