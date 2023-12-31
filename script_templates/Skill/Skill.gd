extends Skill


func _init():
	init(0) # Set cooldown
	super._init()

func execute(p_player: Player):
	if not in_cooldown:
		
		# Define logic
		
		super.execute(p_player)
