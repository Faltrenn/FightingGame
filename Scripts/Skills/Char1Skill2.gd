class_name Char1Skill2 extends Skill


func _ready():
	cooldown = 1.0 # Define cooldown
	super._ready()

func execute():
	if cd_timer.is_stopped():
		var dash = Dash.new()
		player.add_child(dash)
		dash.init(Vector2.RIGHT, 500, 200)
		super.execute()
