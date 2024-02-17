class_name Entity extends CharacterBody2D


signal damaged(amount: int)

var hitbox : CollisionShape2D

var health : int = 100:
	set(value):
		health = clamp(value, 0, 100)

func make_damage(amount: int):
	health -= amount
	damaged.emit(amount)

func _ready():
	hitbox = find_child("Hitbox") as CollisionShape2D
	if not hitbox:
		push_error("Entity sem Hitbox em: ", name)
	
