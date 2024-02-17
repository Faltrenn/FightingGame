class_name Dash extends Node


signal end

var direction: Vector2
var speed: float
var max_range: float
var initial_position: Vector2
var parent: Node2D

func init(p_direction: Vector2, p_speed: float, p_max_range: float, pass_trought: bool = true):
	var p = get_parent()
	
	if p is Node2D:
		if p is Player:
			p.can_move = false
			if pass_trought:
				p.hitbox.disabled = true
				end.connect(func (): p.hitbox.disabled = false)
		parent = p
		initial_position = parent.position
		direction = p_direction
		speed = p_speed
		max_range = p_max_range
	else:
		push_error("Parent is not Node2D in ", name)

func _physics_process(delta: float):
	if parent:
		parent.position += direction * speed * delta
		if abs(initial_position - parent.position).length() >= max_range:
			parent.can_move = true
			end.emit()
			queue_free()
