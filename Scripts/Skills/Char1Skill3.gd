class_name Char1Skill3 extends Skill


const DAMAGE := 5

func _ready():
	cooldown = .5 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var area := AreaDamage.new(3, 1, 150, player.mouse_position, true)
		area.tick.connect(_hit)
		get_node("/root").add_child(area)
		super.execute()

func _hit(bodies: Array[Node2D]):
	for body in bodies:
		if body is Entity:
			body.make_damage(DAMAGE)
