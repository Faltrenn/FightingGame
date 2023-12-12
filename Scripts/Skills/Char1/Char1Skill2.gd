extends Skill

var effect = preload("res://Scripts/Effects/Char1/Char1Effect1.gd")

func _init():
	super._init()
	cooldown = 2

func execute(player: Player):
	if not in_cooldown:
		var e = Core.spawn_node(player, effect) as Effect
		e.init(3, 2, true, player)
		in_cooldown = true
