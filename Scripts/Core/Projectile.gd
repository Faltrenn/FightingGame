class_name Projectile extends Area2D


signal on_hit(projectile: Projectile, body)

var speed: float
var direction: Vector2
var max_range: float
var initial_position: Vector2

var target: Node2D

func _ready():
	body_entered.connect(func (body: Node2D): on_hit.emit(self, body))

func start(p_position: Vector2, p_direction: Vector2, p_range: float, p_speed: float = 800.0):
	global_position = p_position
	direction = p_direction
	max_range = p_range
	speed = p_speed
	initial_position = position
	rotation = direction.angle() - PI/2

func _physics_process(delta: float):
	if target:
		direction = (target.global_position - global_position).normalized()
		rotation = direction.angle() - PI/2
	elif direction:
		if abs(initial_position - position).length() >= max_range:
			queue_free()
	global_position += direction * speed * delta
