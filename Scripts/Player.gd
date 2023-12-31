extends Entity
class_name Player

@onready var fps_counter: Label = $"../UI/FPSCounter"

@export var char_res: CharacterRes

@export var skills: Array[Node2D]

var look_input: Vector2 = Vector2.RIGHT
var move_input: Vector2 = Vector2.RIGHT

var can_move: bool = true

var auto_walk_pos: Vector2 = Vector2.ZERO
var auto_walk_dir: Vector2 = Vector2.ZERO

func _ready():
	init(100, 700)
	
	for i in range(0,4):
		skills[i].set_script(char_res.skills[i])

func _process(_delta: float):
	var g_look = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
	if g_look:
		look_input = g_look
	
	for i in range(0,4):
		if Input.is_action_just_pressed("skill_" + str(i+1)):
			var skill = skills[i] as Skill
			if skill:
				skill.execute(self)
	fps_counter.text = "FPS: " + str(Engine.get_frames_per_second())
	
	if auto_walk_dir > Vector2.ZERO and position >= auto_walk_pos or auto_walk_dir < Vector2.ZERO and position <= auto_walk_pos:
		reset_auto_walk()

func _input(event: InputEvent):
	if event as InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			auto_walk_pos = event.position
			auto_walk_dir = (event.position - position).normalized()
	elif event as InputEventMouseMotion:
		look_input = (event.position - position).normalized()

func reset_auto_walk():
	auto_walk_dir = Vector2.ZERO
	auto_walk_pos = Vector2.ZERO

func _physics_process(_delta: float):
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if move_input:
		reset_auto_walk()
	if can_move:
		velocity = (move_input if move_input else auto_walk_dir) * speed
	move_and_slide()
