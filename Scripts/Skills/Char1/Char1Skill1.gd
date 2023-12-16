class_name Char1Skill1
extends Skill

const projectile = preload("res://Scenes/projectile.tscn")

func _init():
	super._init()
	cooldown = 1.5

func execute(_player: Player):
	if not in_cooldown and _player.look_input:
		player = _player
		var p = projectile.instantiate() as Projectile
		get_node("/root").add_child(p)
		p.position = player.position
		p.init(player.look_input, 1200, 500)
		in_cooldown = true
