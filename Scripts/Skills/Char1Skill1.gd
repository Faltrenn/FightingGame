class_name Char1Skill1 extends Skill


const projectile_tscn = preload("res://Scenes/Prefabs/projectile.tscn")

const RANGE := 500.0
const PROJECTILE_SPEED := 950.0

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped() and player.look_input:
		var p = projectile_tscn.instantiate() as Projectile
		p.on_hit.connect(_on_hit)
		add_child(p)
		p.start(player.global_position, player.look_input, RANGE, PROJECTILE_SPEED)
		super.execute()

func _on_hit(projectile: Projectile, body: Node):
	if body is Entity and body != player:
		body.make_damage(10)
		projectile.queue_free()
