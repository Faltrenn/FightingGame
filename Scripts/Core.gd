class_name Core

static var node = preload("res://Node.tscn")

static func spawn_node(where: Node, script: Script) -> Node:
	var n = node.instantiate()
	n.set_script(script)
	
	where.add_child(n)
	
	return n
