class_name Projectile extends Area2D


var speed: float
var direction: Vector2
var max_range: float
var initial_position: Vector2

func start(p_position: Vector2, p_direction: Vector2, p_range: float, p_speed: float = 800.0):
	global_position = p_position
	direction = p_direction
	max_range = p_range
	speed = p_speed
	initial_position = position
	rotation = direction.angle() - PI/2

func _physics_process(delta: float):
	if direction: 
		position += direction * speed * delta
		if abs(initial_position - position).length() >= max_range:
			queue_free()
