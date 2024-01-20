class_name Projectile extends Area2D


var speed: float
var direction: Vector2
var max_range: float
var initial_position: Vector2

func _init():
	var cs = CollisionShape2D.new()
	add_child(cs)
	cs.shape = CapsuleShape2D.new()
	cs.shape.radius = 5
	cs.shape.height = 20
	var mi = MeshInstance2D.new()
	add_child(mi)
	mi.mesh = CapsuleMesh.new()
	mi.mesh.radius = 5
	mi.mesh.height = 20

func start(p_position: Vector2, p_direction: Vector2, p_range: float, p_speed: float = 800.0):
	global_position = p_position
	direction = p_direction
	max_range = p_range
	speed = p_speed
	initial_position = position

func _physics_process(delta: float):
	if direction:
		position += direction * speed * delta
		if abs(initial_position - position).length() > max_range:
			queue_free()
