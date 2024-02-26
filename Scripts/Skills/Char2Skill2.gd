class_name Char2Skill2 extends Skill


const DAMAGE := 15.0

var shape_cast : Hitbox

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	var li = player.look_input
	if timer.is_stopped() and li:
		shape_cast = Hitbox.cone(150, li, 120, [player])
		shape_cast.position = player.global_position
		get_node("/root").add_child(shape_cast)
		shape_cast.body_entered.connect(_hit)
		shape_cast.one_shot()
		super.execute()

func _hit(body: Node2D):
	if body != player and body is Entity:
		body.make_damage(DAMAGE)
		body.add_effect(HotFire.new())
