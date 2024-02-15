class_name Hitbox

static func circle(radius: float) -> Area2D:
	var area = Area2D.new()
	var cs = CollisionShape2D.new()
	cs.shape = CircleShape2D.new()
	cs.shape.radius = radius
	area.add_child(cs)
	return area

static func rectangle(width: float, height: float) -> Area2D:
	var area = Area2D.new()
	var cs = CollisionShape2D.new()
	cs.shape = RectangleShape2D.new()
	cs.shape.size = Vector2(width, height)
	area.add_child(cs)
	return area

