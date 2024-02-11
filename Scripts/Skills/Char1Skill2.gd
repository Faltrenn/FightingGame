class_name Char1Skill2 extends Skill


func _ready():
	cooldown = 1.0 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped() and player.look_input:
		var dash = Dash.new()
		player.add_child(dash)
		dash.init(player.look_input, 500, 200)
		super.execute()
