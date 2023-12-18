extends Skill

const projectile = preload("res://Scenes/projectile.tscn")

func _init():
	cooldown = 1.5
	super._init()

func execute(_player: Player):
	if not in_cooldown and _player.look_input:
		player = _player
		var p = projectile.instantiate() as Projectile
		get_node("/root").add_child(p)
		p.position = player.position
		p.init(player, player.look_input, 1200, 500)
		in_cooldown = true
