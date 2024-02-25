class_name HotFire extends Effect


const TICKS = 6
const TICK_TIME = .5
const DAMAGE := 3

@onready var target : Entity = get_parent().get_parent()

func _ready():
	set_tick_timer(TICKS, TICK_TIME)
	timer.end.connect(queue_free)

func tick():
	target.make_damage(DAMAGE)
