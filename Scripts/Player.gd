extends Entity
class_name Player

@onready var fps_counter: Label = $"../UI/FPSCounter"

@export var char_res: CharacterRes

@export var skills: Array[Node2D]

var look_input: Vector2 = Vector2.RIGHT
var move_input: Vector2 = Vector2.RIGHT

var can_move: bool = true

func _ready():
	init(100, 700)
	
	for i in range(0,4):
		skills[i].set_script(char_res.skills[i])

func _process(_delta):
	look_input = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
	
	for i in range(0,4):
		if Input.is_action_just_pressed("skill_" + str(i+1)):
			var skill = skills[i] as Skill
			if skill:
				skill.execute(self)
	fps_counter.text = "FPS: " + str(Engine.get_frames_per_second())

func _physics_process(_delta):
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if can_move:
		velocity = move_input * speed
	
	move_and_slide()
