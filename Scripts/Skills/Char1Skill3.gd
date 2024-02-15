class_name Char1Skill3 extends Skill


const DAMAGE := 20

var hitted : Array[Node2D] = []

func _ready():
	cooldown = .5 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped() and player.look_input:
		var dash = Dash.new()
		player.add_child(dash)
		dash.init(player.look_input, 800, 600)
		var area = Area2D.new()
		var cs = CollisionShape2D.new()
		area.add_child(cs)
		cs.shape = CircleShape2D.new()
		cs.shape.radius = 100
		player.add_child(area)
		area.body_entered.connect(_hit)
		dash.end.connect(area.queue_free)
		super.execute()

func _hit(body: Node2D):
	if body is Entity and body not in hitted:
		body.make_damage(DAMAGE)
		hitted.append(body)
