class_name Dash
extends Node

var player: Player
var max_range: Vector2
var initial_position: Vector2

func init(p_player: Player, p_range: int, p_direction: Vector2, p_speed: int):
	player = p_player
	player.collision_mask = 0
	initial_position = player.position
	max_range = abs(p_direction * p_range)
	player.can_move = false
	player.velocity = p_direction * p_speed
	set_physics_process(true)

func _physics_process(_delta):
	if player and abs(player.position - initial_position) >= max_range:
		player.can_move = true
		player.collision_mask = 1
		queue_free()
