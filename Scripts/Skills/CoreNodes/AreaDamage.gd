extends Effect

var collisions: Array[Entity] = []

func _init():
	var area = Area2D.new()
	add_child(area)
	area.connect("body_entered", body_entered)
	area.connect("body_exited", body_exited)
	var cs = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = 200
	cs.shape = shape
	area.add_child(cs)
	
	var mi = MeshInstance2D.new()
	var mesh = CapsuleMesh.new()
	mesh.radius = 200
	mesh.height = 400
	
	mi.mesh = mesh
	area.add_child(mi)
	
	super._init()


func body_entered(body: Node2D):
	var entity = body as Entity
	if entity and entity != player:
		collisions.append(entity)

func body_exited(body: Node2D):
	var entity = body as Entity
	if entity and entity != player:
		collisions.remove_at(collisions.find(entity))

func tick():
	for collision in collisions:
		collision.make_damage(14)
	super.tick()

func end():
	pass
