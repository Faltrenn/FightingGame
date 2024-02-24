class_name Char3Skill1 extends Skill


const DAMAGE := 6.0

func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var th = TickHitbox.new(Hitbox.circle(100), 10, .1, player.mouse_position, true)
		th.tick.connect(_hit)
		add_child(th)
		
		super.execute()

func _hit(bodies: Array[Node2D]):
	for body in bodies:
		if body != player and body is Entity:
			body.make_damage(DAMAGE)
