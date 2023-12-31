extends Node2D

var timer = Timer.new()
var player: Player

var ticks: int

var insta: bool

var shape_cast: ShapeCast2D = ShapeCast2D.new()

func init(	duration: float,
			p_ticks: int,
			p_insta: bool,
			mi: MeshInstance2D,
			shape: Shape2D,
			target: Vector2,
			p_player: Player):
	ticks = p_ticks
	player = p_player
	insta = p_insta
	timer.wait_time = duration/p_ticks
	timer.start()
	
	shape_cast.target_position = target
	shape_cast.shape = shape
	shape_cast.add_child(mi)

func _init():
	add_child(shape_cast)
	add_child(timer)
	timer.connect("timeout", tick)

func _process(_delta: float):
	if insta:
		tick()
		set_process(false)

func tick():
	for collision in shape_cast.collision_result:
		var entity = collision.collider as Entity
		if entity:
			entity.make_damage(14)
	ticks -= 1
	if ticks == 0:
		queue_free()

func end():
	pass
