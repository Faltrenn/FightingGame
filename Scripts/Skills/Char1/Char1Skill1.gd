extends Skill

const projectile = preload("res://Scenes/projectile.tscn")

func _init():
	init(1.5)
	super._init()

func execute(p_player: Player):
	if not in_cooldown and p_player.look_input:
		var p = projectile.instantiate() as Projectile
		get_node("/root").add_child(p)
		p.position = p_player.position
		p.init(p_player, p_player.look_input, 1200, 500)
		super.execute(p_player)
