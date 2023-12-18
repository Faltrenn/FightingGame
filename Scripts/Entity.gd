class_name Entity
extends CharacterBody2D

var health: int
var speed: int

func init(_health: int, _speed: int):
	health = _health
	speed = _speed

func make_damage(damage: int):
	health -= damage
