extends Skill


const RANGE: float = 600
const DURATION := 1
const TICKS := 1

func _init():
	init(1.3) # Set cooldown
	super._init()

func execute():
	if not in_cooldown and player.look_input:
		var direction = player.look_input
		
		var sa = ShowArea.new()
		get_node("/root").add_child(sa)
		sa.position = global_position
		var mesh = PlaneMesh.new()
		mesh.size = Vector2(RANGE, 40)
		mesh.orientation = PlaneMesh.FACE_Z
		mesh.center_offset.x = RANGE/2
		sa.init(.5, mesh, direction.angle())
		
		var shape = RectangleShape2D.new()
		shape.size = Vector2(RANGE, 40)
		var ad = AreaDamage.new()
		sa.add_child(ad)
		ad.init(.1, 1, true, true, shape, direction, player)
		
		super.execute()
