class_name SomeSkill extends Skill


func _ready():
	cooldown = .1 # Define cooldown
	super._ready()

func execute():
	if timer.is_stopped():
		var ray = ScreenRay.new(player.mouse_position)
		get_node("/root").add_child(ray)
		var collider = ray.collide()
		print(collider)
		if collider is Entity:
			collider.add_effect(HotFire.new())
			super.execute()
