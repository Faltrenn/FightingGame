class_name Hitbox extends Area2D


func _init(shape: Shape2D):
	var cs = CollisionShape2D.new()
	cs.shape = shape
	add_child(cs)

static func circle(radius: float) -> Hitbox:
	var shape = CircleShape2D.new()
	shape.radius = radius
	return Hitbox.new(shape)

static func rectangle(width: float, height: float) -> Hitbox:
	var shape = RectangleShape2D.new()
	shape.size = Vector2(width, height) 
	return Hitbox.new(shape)

static func cone(radius: float, direction: Vector2, arc_angle: float) -> Hitbox:
	var shape = ConvexPolygonShape2D.new()
	var angle = rad_to_deg(direction.angle()) + arc_angle/2
	var points: Array[Vector2] = [Vector2(0, 0)]
	var offset = arc_angle / 5
	while arc_angle >= 0:
		var dir = Vector2.from_angle(deg_to_rad(angle))
		points.append(dir * radius)
		arc_angle -= offset
		angle -= offset
	shape.points = points
	
	return Hitbox.new(shape)
