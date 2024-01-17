extends Skill

const projectile = preload("res://Scenes/projectile.tscn")

func _init():
	player = get_parent()
	init(1.5)
	super._init()

func execute():
	if not in_cooldown and player.look_input:
		var p = projectile.instantiate() as Projectile
		get_node("/root").add_child(p)
		p.position = player.position
		p.init(player, player.look_input, 1200, 500)
		p.hit.connect(_on_hit)
		super.execute()

func _on_hit(projectile: Projectile, body: Node2D):
	if body is Entity and body != player:
		body.make_damage(10)
		projectile.queue_free()
