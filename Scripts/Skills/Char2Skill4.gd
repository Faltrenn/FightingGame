class_name Char2Skill4 extends Skill


const DELAY := .6
const MULTIPLIYER := 4

var area : Hitbox

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		area = Hitbox.circle(100, [player])
		area.position = player.mouse_position
		get_node("/root").add_child(area)
		var t = Timer.new()
		t.autostart = true
		t.one_shot = true
		t.wait_time = DELAY
		area.add_child(t)
		t.timeout.connect(_hit)
		super.execute()

func _hit():
	for body in area.old_collision:
		if body is Entity and body != self:
			for effect in body.effects:
				if effect is HotFire:
					body.make_damage(effect.damage * MULTIPLIYER)
					effect._end()
	area.queue_free()
