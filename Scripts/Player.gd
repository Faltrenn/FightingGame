class_name Player extends Entity


const SPEED := 300.0

@onready var aim := $Aim
@onready var collisor := $Hitbox as CollisionShape2D

var move_input : Vector2:
	get:
		var input := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
		if input and auto_walk:
			auto_walk = false
		return input

var look_input : Vector2:
	get: # NOTE: Fazer um sistema pra detectar se sefine look_input com gamepad ou mouse
		var input = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
		if not input:
			input = move_input
		return input if input else (mouse_position - global_position).normalized()

var mouse_position: Vector2:
	get:
		return get_global_mouse_position()

var can_move := true:
	set(value):
		if value:
			auto_walk_position = auto_walk_position
		else:
			velocity = Vector2.ZERO
		can_move = value

var auto_walk_side := false
var auto_walk := false
var auto_walk_position : Vector2:
	set(value):
		auto_walk_side = (value - global_position) < Vector2.ZERO
		auto_walk_position = value

var auto_walk_distance : Vector2:
	get:
		return (auto_walk_position - global_position)
@onready var name_label := $Name as Label
@export var characters: Array[CharacterRes]
@export var skills_ui: Array[SkillUI] = [null, null, null, null]
var skills: Array[Skill] = [null, null, null, null]

func _ready():
	super._ready()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	if characters:
		_load_char(characters[0])
	else:
		push_error("Character not defined in ", name)

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_pressed():
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_RIGHT:
				auto_walk = true
				auto_walk_position = mouse_position
	if event.as_text().is_valid_int():
		_load_char(characters[int(event.as_text())-1])
	
	for i in range(0,4):
		if event.is_action_pressed("skill_" + str(i+1)):
			if skills[i]:
				skills[i].execute()

func _process(_delta:float):
	aim.rotation = look_input.angle()

func _physics_process(_delta: float):
	if can_move:
		if move_input:
			velocity = move_input * SPEED
		elif auto_walk:
			var diff = auto_walk_distance
			if auto_walk_side and diff >= Vector2.ZERO or not auto_walk_side and diff < Vector2.ZERO:
				auto_walk = false
				velocity = Vector2.ZERO
			else:
				velocity = auto_walk_distance.normalized() * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _load_char(character: CharacterRes):
	name_label.text = character.name
	for child in get_children():
		if child is Skill:
			child.queue_free()
	skills = []
	var counter := -1
	for skill in character.skills:
		counter += 1
		if skill:
			var s = skill.new() as Skill
			add_child(s)
			skills.append(s)
			s.player = self
			skills_ui[counter].skill = s
			continue
		else:
			skills_ui[counter].skill = null
		skills.append(skill)
