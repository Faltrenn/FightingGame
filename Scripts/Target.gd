extends Entity

var damage_label = preload("res://Scripts/DamageLabel.gd")

@onready var damage_field = $DamageField

func _ready():
	init(100, 0)

func make_damage(damage: int):
	super.make_damage(damage)
	var label = damage_label.new()
	label.text = "Dano: " + str(damage)
	damage_field.add_child(label)
