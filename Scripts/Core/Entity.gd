class_name Entity extends CharacterBody2D


signal damaged(amount: int)

@export var health_label : Label
@export var shield_label : Label
@export var damage_log : VBoxContainer

var hitbox : CollisionShape2D
var _effects := Node.new()
var effects : Array[Effect]:
	get:
		var l: Array[Effect] = []
		for en in _effects.get_children():
			if en is Effect:
				l.append(en)
		return l

var health : int:
	set(value):
		health = clamp(value, 0, 100)
		health_label.text = "Vida: %d" % health

var shield : int:
	set(value):
		shield = value if value > 0 else 0
		shield_label.text = "Escudo: %d" % shield

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

func _create_damage_label(amount: int):
	var label = DamageLabel.new()
	damage_log.add_child(label)
	label.text = "Dano: " + str(amount)

func _ready():
	health = 100
	shield = 15
	damaged.connect(_create_damage_label)
	if not health_label:
		push_error("health_label not defined on: ", name)
	if not damage_log:
		push_error("damage_log not defined on: ", name)
		
	hitbox = find_child("Hitbox") as CollisionShape2D
	if not hitbox:
		push_error("Entity sem Hitbox em: ", name)
	_effects.name = "Effects"
	add_child(_effects)
