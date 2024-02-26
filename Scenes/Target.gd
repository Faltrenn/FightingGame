class_name Target extends Entity


@export var move := false

@export var shoot_dir : Vector2

var direction := 1
var initial_position: Vector2

func _init():
	initial_position = position

func _ready():
	set_physics_process(move)
	if shoot_dir:
		var timer = Timer.new()
		timer.autostart = true
		timer.wait_time = .3
		timer.timeout.connect(shoot)
		add_child(timer)
	super._ready()

func shoot():
	var p = Projectile.new(global_position, shoot_dir, 500)
	get_node("/root").add_child(p)
	p.on_hit.connect(_hit)

func _hit(_projectile: Projectile, body: Node2D):
	if body is Entity and body != self:
		body.make_damage(2)

func _physics_process(delta: float):
	position += Vector2.DOWN * direction * 250.0 * delta
	if (position - initial_position).length() >= 300:
		direction *= -1
