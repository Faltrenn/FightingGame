extends Skill

func _init():
	super._init()

func reset_cooldown(delta: float):
	super.reset_cooldown(delta)

func _process(delta: float):
	super._process(delta)

func execute(_player: Player): pass
