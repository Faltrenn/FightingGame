class_name Core

static func spawn_node(where: Node, script: Script) -> Node:
	var n = Node.new()
	n.set_script(script)
	
	where.add_child(n)
	
	return n
