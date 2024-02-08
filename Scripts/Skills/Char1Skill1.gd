class_name Char1Skill1 extends Skill


const projectile = preload("res://Scenes/Prefabs/projectile.tscn")

const RANGE := 600.0

func _ready():
	cooldown = 1.5 # Define cooldown
	super._ready()

func execute():
	if cd_timer.is_stopped() and player.look_input:
		var p := projectile.instantiate() as Projectile
		add_child(p)
		p.start(player.global_position, player.look_input, RANGE, 100)
		super.execute()
