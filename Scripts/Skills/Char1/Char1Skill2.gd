extends Skill

var effect = preload("res://Scripts/Effects/Char1/Char1Effect1.gd")

func _init():
	cooldown = 2
	super._init()

func execute(_player: Player):
	if not in_cooldown:
		var e = Core.spawn_node(_player, effect) as Effect
		e.init(3, 2, true, _player)
		in_cooldown = true
