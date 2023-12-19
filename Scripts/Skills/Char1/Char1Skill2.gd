extends Skill

var effect = preload("res://Scripts/Effects/Char1/Char1Effect1.gd")

func _init():
	cooldown = 2
	super._init()

func execute(p_player: Player):
	if not in_cooldown:
		var e = effect.new()
		p_player.add_child(e)
		e.init(3, 2, true, p_player)
		super.execute(p_player)
