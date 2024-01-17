class_name Projectile extends Area2D


signal hit(projectile: Projectile, body: Node2D)

var direction: Vector2
var speed: int
var max_range: Vector2
var initial_position: Vector2
var player: Player

func init(p_player: Player, p_direction: Vector2, p_speed: int, p_range: int):
	player = p_player
	direction = p_direction
	rotation = direction.angle()
	max_range = abs(direction * p_range)
	initial_position = position
	speed = p_speed
	set_process(true)

func _physics_process(delta:float):
	if direction:
		position += direction * speed * delta
		if abs(position - initial_position) >= max_range:
			queue_free()

func body_entered(body: Node2D):
	hit.emit(self, body)
