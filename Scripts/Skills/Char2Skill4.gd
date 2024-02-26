class_name Char2Skill4 extends Skill


func _ready():
	cooldown = .0 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var ad = Hitbox.circle(130, [player])
		super.execute()
