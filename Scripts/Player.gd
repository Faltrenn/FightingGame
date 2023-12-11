extends Entity
class_name Player

const projectile = preload("res://Scenes/projectile.tscn")

@onready var fps_counter: Label = $"../UI/FPSCounter"

func _ready():
	init(100, 700)

func _process(_delta):
	var look_input = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
	if Input.is_action_pressed("skill_1"):
		var p = projectile.instantiate() as Projectile
		get_node("/root").add_child(p)
		p.position = position
		p.init(look_input)
	if Input.is_action_pressed("skill_2"):
		pass
	
	fps_counter.text = "FPS: " + str(Engine.get_frames_per_second())

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
	move_and_slide()
