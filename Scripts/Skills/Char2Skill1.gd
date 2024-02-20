class_name Char2Skill1 extends Skill


const DAMAGE := 3.0

var projectile_tscn = preload("res://Scenes/Prefabs/projectile.tscn")

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var ray = RayCast2D.new()
		ray.target_position = Vector2.ZERO
		get_node("/root").add_child(ray)
		ray.position = player.mouse_position
		ray.hit_from_inside = true
		ray.force_raycast_update()
		
		var collider = ray.get_collider()
		ray.queue_free()
		if collider is Entity:
			var p = projectile_tscn.instantiate() as Projectile
			get_node("/root").add_child(p)
			p.on_hit.connect(_on_hit)
			p.target = collider
			p.start(player.global_position, Vector2.ZERO, 0, 550)
			super.execute()

func _on_hit(projectile: Projectile, body: Node2D):
	if body == projectile.target:
		body.make_damage(DAMAGE)
		projectile.queue_free()
