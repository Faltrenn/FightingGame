class_name Char3Skill1 extends Skill


const DAMAGE := 6.0

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var p = Projectile.new(player.position, player.look_input, 650)
		get_node("/root").add_child(p)
		p.on_hit.connect(_hit)
		p.on_max_range.connect(_create_area)
		super.execute()

func _hit(projectile: Projectile, body: Node2D):
	if body != player and body is Entity:
		_create_area(projectile)
		projectile.queue_free()

func _create_area(projectile: Projectile):
	var h = Hitbox.circle(100, [player])
	h.position = projectile.position
	get_node("/root").add_child(h)
	h.one_shot()
	for col in h.old_collision:
		if col is Entity:
			col.make_damage(DAMAGE)
