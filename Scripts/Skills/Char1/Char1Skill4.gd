extends Skill

var area_damage = preload("res://Scripts/Skills/CoreNodes/AreaDamage.gd")

func _init():
	init(6)
	super._init()

func execute(p_player: Player):
	if not in_cooldown:
		var ad = area_damage.new()
		ad.init(3, 10, true, p_player)
		add_child(ad)
		super.execute(p_player)
