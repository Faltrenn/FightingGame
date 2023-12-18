extends Entity

@onready var label = $Label

func _ready():
	init(100, 0)

func make_damage(damage: int):
	super.make_damage(damage)
	label.text = "Dano: " + str(damage)
