class_name Projectile extends Node2D


signal on_hit(projectile: Projectile, body: Node2D)
signal on_max_range(projectile: Projectile)

var speed: float
var direction: Vector2
var max_range: float
var initial_position: Vector2

func _init(p_position: Vector2, p_direction: Vector2, p_range: float, p_speed: float = 800.0):
	position = p_position
	direction = p_direction
	max_range = p_range
	speed = p_speed
	initial_position = position
	rotation = direction.angle() - PI/2

func _ready():
	var hitbox = Hitbox.circle(10, [self])
	add_child(hitbox)
	hitbox.body_entered.connect(func (body: Node2D): on_hit.emit(self, body))

func _physics_process(delta: float):
	if direction:
		if abs(initial_position - position).length() >= max_range:
			queue_free()
			on_max_range.emit(self)
		position += direction * speed * delta
