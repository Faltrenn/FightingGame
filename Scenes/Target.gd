extends Entity

@onready var damage_log = $DamageLog
@onready var health_label = $Health

func _init():
	damaged.connect(create_damage_label)
	damaged.connect(func (_v): health_label.text = "Vida: " + str(health))

func create_damage_label(amount: int):
	var label = DamageLabel.new()
	damage_log.add_child(label)
	label.text = "Dano: " + str(amount)
