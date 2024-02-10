class_name Entity extends CharacterBody2D


signal damaged(amount: int)

var health : int = 100:
	set(value):
		health = clamp(value, 0, 100)

func make_damage(amount: int):
	health -= amount
	damaged.emit(amount)
