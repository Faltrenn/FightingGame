class_name Hitbox extends ShapeCast2D


signal body_entered(body: Node2D)

var old_collision : Array[Node2D] = []
var exclude : Array[Node2D] = []

func _init(p_shape: Shape2D, p_exclude: Array[Node2D] = []):
	shape = p_shape
	exclude = p_exclude
	target_position = Vector2.ZERO

func _physics_process(_delta: float):
	collide()

func collide():
	var collisions : Array[Node2D] = []
	for collision in collision_result:
		if collision.collider not in exclude:
			collisions.append(collision.collider)
	
	for collision in collisions:
		if collision not in old_collision:
			old_collision.append(collision)
			body_entered.emit(collision)
	
	for collision in old_collision:
		if collision not in collisions:
			old_collision.erase(collision)

func one_shot():
	force_shapecast_update()
	collide()
	queue_free()
	var show_shape = ShowShape.new(shape, not old_collision.is_empty())
	show_shape.position = global_position
	get_node("/root").add_child(show_shape)

static func circle(radius: float, p_exclude: Array[Node2D] = []) -> Hitbox:
	var s = CircleShape2D.new()
	s.radius = radius
	return Hitbox.new(s, p_exclude)

static func rectangle(width: float, height: float, p_exclude: Array[Node2D] = []) -> Hitbox:
	var s = RectangleShape2D.new()
	s.size = Vector2(width, height) 
	return Hitbox.new(s, p_exclude)

static func cone(radius: float, direction: Vector2, arc_angle: float, p_exclude: Array[Node2D] = []) -> Hitbox:
	var s = ConvexPolygonShape2D.new()
	var angle = rad_to_deg(direction.angle()) + arc_angle/2
	var points: Array[Vector2] = [Vector2(0, 0)]
	var offset = arc_angle / 5
	while arc_angle >= 0:
		var dir = Vector2.from_angle(deg_to_rad(angle))
		points.append(dir * radius)
		arc_angle -= offset
		angle -= offset
	s.points = points
	
	return Hitbox.new(s, p_exclude)
