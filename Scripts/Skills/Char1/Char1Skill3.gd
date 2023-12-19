extends Skill

var dash = preload("res://Scripts/Skills/CoreNodes/Dash.gd")

func _init():
	cooldown = 1.2
	super._init()

func execute(p_player: Player):
	if not in_cooldown and p_player.move_input:
		var d = dash.new()
		p_player.add_child(d)
		d.init(p_player, 500, p_player.move_input, p_player.speed * 2)
		super.execute(p_player)
