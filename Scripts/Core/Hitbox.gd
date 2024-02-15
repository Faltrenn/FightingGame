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
