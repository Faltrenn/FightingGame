class_name Projectile
extends Area2D

var direction: Vector2
const speed: int = 1200

func init(_direction: Vector2):
	direction = _direction
	rotation = direction.angle()
	set_process(true)

func _physics_process(delta):
	if direction:
		position += direction * speed * delta

func body_entered(body: Node2D):
	print("Colidiu com: ", body.name)
