extends Skill

var effect = preload("res://Scripts/Effects/Char1/Char1Effect1.gd")

func _init():
	cooldown = 2
	super._init()

func execute():
	if not in_cooldown:
		var e = effect.new()
		player.add_child(e)
		e.init(3, 2, true, player)
		super.execute()
