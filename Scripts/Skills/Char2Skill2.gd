class_name Char2Skill2 extends Skill


func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		# Logic
		super.execute()
