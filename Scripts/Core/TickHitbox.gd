class_name TickHitbox extends Hitbox


signal tick(bodies: Array[Node2D])

var max_ticks : int
var tick_time : float
var timer := Timer.new()
var insta : bool

func _init(hitbox: Hitbox, p_max_ticks: int, p_tick_time: float, p_position := Vector2.ZERO, p_insta := false):
	old_collision = hitbox.old_collision
	exclude = hitbox.exclude
	shape = hitbox.shape
	target_position = hitbox.target_position
	
	position = p_position
	
	max_ticks = p_max_ticks
	tick_time = p_tick_time
	insta = p_insta
	
	add_child(timer)
	timer.wait_time = tick_time
	timer.autostart = true
	timer.timeout.connect(_tick)

func _ready():
	if insta:
		force_shapecast_update()
		_tick()

func _tick():
	collide()
	tick.emit(old_collision)
	max_ticks -= 1
	if max_ticks == 0:
		queue_free()
