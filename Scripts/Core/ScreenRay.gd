class_name ScreenRay extends RayCast2D


func _init(p_position: Vector2):
	position = p_position
	target_position = Vector2.ZERO
	hit_from_inside = true

func collide() -> Object:
	force_raycast_update()
	queue_free()
	return get_collider()
