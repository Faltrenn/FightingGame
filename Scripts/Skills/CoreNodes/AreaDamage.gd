class_name AreaDamage
extends Node2D

var timer = Timer.new()
var player: Player

var ticks: int

var insta: bool
var single_damage: bool
var damaged_entities: Array[Entity] = []

var hitbox := ShapeCast2D.new()

func init(	duration: float,
			p_ticks: int,
			p_insta: bool,
			p_single_damage: bool,
			shape: Shape2D,
			direction: Vector2,
			p_player: Player):
	ticks = p_ticks
	player = p_player
	insta = p_insta
	single_damage = p_single_damage
	
	add_child(hitbox)
	hitbox.shape = shape
	hitbox.position = direction * 300
	hitbox.target_position = Vector2.ZERO
	hitbox.rotation = direction.angle()
	hitbox.force_shapecast_update()
	
	if insta:
		tick()
	
	timer.wait_time = duration/p_ticks
	timer.start()

func _init():
	add_child(timer)
	timer.one_shot = false
	timer.connect("timeout", tick)

func _process(_delta: float):
	if insta:
		tick()
		set_process(false)

func tick():
	for collision in hitbox.collision_result:
		if collision.collider is Entity:
			if single_damage:
				if collision.collider not in damaged_entities:
					collision.collider.make_damage(14)
					damaged_entities.append(collision.collider)
			else:
				collision.collider.make_damage(14)
	ticks -= 1
	if ticks == 0:
		queue_free()
