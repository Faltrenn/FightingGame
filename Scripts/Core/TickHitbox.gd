class_name TickHitbox extends Hitbox


signal tick(bodies: Array[Node2D])

var timer : TickTimer

func _init(hitbox: Hitbox, ticks: int, tick_time: float, p_position := Vector2.ZERO, insta := false):
	old_collision = hitbox.old_collision
	exclude = hitbox.exclude
	shape = hitbox.shape
	target_position = hitbox.target_position
	
	if insta: ready.connect(_tick)
	
	position = p_position
	
	timer = TickTimer.new(ticks - int(insta), tick_time)
	add_child(timer)
	timer.tick.connect(_tick)
	timer.last_tick.connect(queue_free)

func _enter_tree():
	force_shapecast_update()

func _tick():
	collide()
	tick.emit(old_collision)
