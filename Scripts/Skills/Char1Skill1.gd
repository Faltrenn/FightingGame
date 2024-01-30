class_name Char1Skill1 extends Skill


const RANGE := 600.0

func _ready():
	cooldown = 1.5 # Define cooldown
	super._ready()

func execute():
	if cd_timer.is_stopped() and player.look_input:
		var p = Projectile.new()
		add_child(p)
		p.start(player.global_position, player.look_input, RANGE)
		cd_timer.start()
		super.execute()
		
