class_name TargetProjectile extends Projectile


var target: Node2D

func _init(p_position: Vector2, p_target: Entity, p_speed: float = 800.0):
	position = p_position
	target = p_target
	speed = p_speed

func _physics_process(delta: float):
	if target:
		direction = (target.global_position - global_position).normalized()
		rotation = direction.angle() - PI/2
		position += direction * speed * delta
