extends Skill


var shape_cast := ShapeCast2D.new()
const RANGE := 600

func _init():
	init(0) # Set cooldown
	super._init()
	
	add_child(shape_cast)

func execute(p_player: Player):
	if not in_cooldown and p_player.look_input:
		shape_cast.target_position = p_player.look_input * RANGE
		
		super.execute(p_player)

