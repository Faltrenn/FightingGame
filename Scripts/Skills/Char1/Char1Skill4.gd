extends Skill

const AREA_DAMAGE = preload("res://Scripts/Skills/CoreNodes/AreaDamage.gd")

const DURATION: float = 5
const TICKS := 10
const RADIUS := 200

func _init():
	init(10)
	super._init()

func execute(p_player: Player):
	if not in_cooldown:
		var ad = AREA_DAMAGE.new()
		add_child(ad)
		
		var shape = CircleShape2D.new()
		shape.radius = RADIUS
		
		var mi = MeshInstance2D.new()
		var mesh = CapsuleMesh.new()
		mesh.radius = RADIUS
		mesh.height = RADIUS * 2
		mi.mesh = mesh
		
		ad.init(DURATION, TICKS, true, false, shape, Vector2.ZERO, p_player)
		super.execute(p_player)
