extends Skill

var area_damage = preload("res://Scripts/AreaDamage.gd")

func execute(_player: Player):
	var ad = area_damage.new()
	ad.init(3, 10, true, _player)
	add_child(ad)
