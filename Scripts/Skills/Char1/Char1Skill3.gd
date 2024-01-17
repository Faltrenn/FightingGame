extends Skill

const DASH = preload("res://Scripts/Skills/CoreNodes/Dash.gd")

func _init():
	cooldown = 1.2
	super._init()

func execute():
	var direction = player.move_input if player.move_input else player.look_input
	if not in_cooldown and direction:
		var d = DASH.new()
		player.add_child(d)
		d.init(player, 500, direction, player.speed * 2)
		player.reset_auto_walk()
		super.execute()
