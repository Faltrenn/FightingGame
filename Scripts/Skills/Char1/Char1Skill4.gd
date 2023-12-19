extends Skill

var area_damage = preload("res://Scripts/Skills/CoreNodes/AreaDamage.gd")

func _init():
	init(6)
	super._init()

func execute(p_player: Player):
	if not in_cooldown:
		var ad = area_damage.new()
		add_child(ad)
		ad.init(3, 2, true, p_player)
		super.execute(p_player)
