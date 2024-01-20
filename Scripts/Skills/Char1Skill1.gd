class_name Char1Skill1 extends Skill


const RANGE := 600.0

func _ready():
	super._ready()
	cooldown = 1.5 # Define cooldown

func execute():
	if player.look_input:
		var p = Projectile.new()
		add_child(p)
		p.start(player.global_position, player.look_input, RANGE)
