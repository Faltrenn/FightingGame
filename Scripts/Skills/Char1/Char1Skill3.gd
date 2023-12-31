extends Skill

var dash = preload("res://Scripts/Skills/CoreNodes/Dash.gd")

func _init():
	cooldown = 1.2
	super._init()

func execute(p_player: Player):
	var direction = p_player.move_input if p_player.move_input else p_player.look_input
	if not in_cooldown and direction:
		var d = dash.new()
		p_player.add_child(d)
		d.init(p_player, 500, direction, p_player.speed * 2)
		p_player.reset_auto_walk()
		super.execute(p_player)
