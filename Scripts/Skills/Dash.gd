class_name Dash
extends Node

var player: Player
var max_range: Vector2
var initial_position: Vector2

func init(_player: Player, _range: int, _direction: Vector2, _speed: int):
	player = _player
	player.collision_mask = 0
	initial_position = player.position
	max_range = abs(_direction * _range)
	player.can_move = false
	player.velocity = _direction * _speed
	set_physics_process(true)

func _physics_process(_delta):
	if player and abs(player.position - initial_position) >= max_range:
		player.can_move = true
		player.collision_mask = 1
		queue_free()
