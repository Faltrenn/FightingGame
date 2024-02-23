class_name Char2Skill1 extends Skill


const DAMAGE := 3.0

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var ray = ScreenRay.new(player.mouse_position)
		get_node("/root").add_child(ray)
		var collider = ray.collide()
		if collider is Entity:
			var p = TargetProjectile.new(player.global_position, collider, 550)
			get_node("/root").add_child(p)
			p.on_hit.connect(_on_hit)
			super.execute()

func _on_hit(projectile: Projectile, body: Node2D):
	if body == projectile.target:
		body.make_damage(DAMAGE)
		projectile.queue_free()
