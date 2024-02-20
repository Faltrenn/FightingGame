class_name AreaDamage extends ShapeCast2D


signal tick(bodies: Array[Node2D])

var timer := Timer.new()
var ticks := 0
var max_ticks : int = 10
var insta_tick : bool

func _init(p_max_ticks: int, wait_time: float, radius: int, p_position: Vector2 = Vector2.ZERO, p_insta_tick: bool = false):
	max_ticks = p_max_ticks
	insta_tick = p_insta_tick
	add_child(timer)
	timer.wait_time = wait_time
	timer.timeout.connect(_tick)
	
	position = p_position
	
	target_position = Vector2.ZERO
	shape = CircleShape2D.new()
	shape.radius = radius

func _ready():
	if insta_tick:
		force_shapecast_update()
		_tick()
	timer.start()

func _tick():
	var collisions: Array[Node2D] = []
	for res in collision_result:
		if res.collider is Node2D:
			collisions.append(res.collider)
	tick.emit(collisions)
	print(collisions)
	ticks += 1
	if ticks >= max_ticks:
		queue_free()
