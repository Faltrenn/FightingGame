extends Skill

var dash = preload("res://Scripts/Skills/Dash.gd")

func _init():
	cooldown = 1.2
	super._init()

func execute(_player: Player):
	if not in_cooldown and _player.move_input:
		var d = dash.new()
		_player.add_child(d)
		d.init(_player, 500, _player.move_input, _player.speed * 2)
		in_cooldown = true
