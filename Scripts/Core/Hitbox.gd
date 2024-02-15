class_name Hitbox extends Area2D


func _init(shape: Shape2D):
	var cs = CollisionShape2D.new()
	cs.shape = shape
	add_child(cs)
