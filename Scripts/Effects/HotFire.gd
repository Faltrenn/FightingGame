class_name HotFire extends Effect


const TICKS := 6
const TICK_TIME := .8
const INCREMENT := 4 

var damage := 3

@onready var target : Entity = get_parent().get_parent()

func _start():
	for effect in entity.effects:
		if effect is HotFire and effect != self:
			effect.buff()
			queue_free()
			return
	_set_tick_timer(TICKS, TICK_TIME)

func _tick():
	target.make_damage(damage)

func buff():
	tick_timer.ticks = TICKS
	damage += INCREMENT
