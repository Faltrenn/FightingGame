class_name Entity extends CharacterBody2D


signal damaged(amount: int)

var hitbox : CollisionShape2D
var _effects := Node.new()
var effects : Array[Effect]:
	get:
		var l: Array[Effect] = []
		for en in _effects.get_children():
			if en is Effect:
				l.append(en)
		return l

var health : int = 100:
	set(value):
		health = clamp(value, 0, 100)

var shield : int = 0

func make_damage(amount: int):
	var rest = shield - amount
	if rest >= 0:
		shield = rest
	else:
		shield = 0
		health += rest
	damaged.emit(amount)

func add_effect(effect: Effect):
	_effects.add_child(effect)

func _ready():
	hitbox = find_child("Hitbox") as CollisionShape2D
	if not hitbox:
		push_error("Entity sem Hitbox em: ", name)
	_effects.name = "Effects"
	add_child(_effects)
