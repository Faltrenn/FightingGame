extends Entity

@onready var damage_log = $DamageLog
@onready var health_label = $Health

var direction := 1
var initial_position: Vector2

func _init():
	damaged.connect(create_damage_label)
	damaged.connect(func (_v): health_label.text = "Vida: " + str(health))
	initial_position = position

func create_damage_label(amount: int):
	var label = DamageLabel.new()
	damage_log.add_child(label)
	label.text = "Dano: " + str(amount)

func _physics_process(delta: float):
	position += Vector2.DOWN * direction * 250.0 * delta
	if (position - initial_position).length() >= 300:
		direction *= -1
