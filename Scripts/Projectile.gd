class_name Projectile
extends Area2D

var direction: Vector2
var speed: int
var max_range: Vector2
var initial_position: Vector2

func init(_direction: Vector2, _speed: int, _range: int):
	direction = _direction
	rotation = direction.angle()
	max_range = abs(direction * _range)
	initial_position = position
	speed = _speed
	set_process(true)

func _physics_process(delta):
	if direction:
		position += direction * speed * delta
		if abs(position - initial_position) >= max_range:
			queue_free()

func body_entered(body: Node2D):
	print("Colidiu com: ", body.name)
