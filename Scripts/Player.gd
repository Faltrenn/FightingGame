class_name Player extends CharacterBody2D


const SPEED = 300.0

var move_input: Vector2 = Vector2.ZERO
var look_input: Vector2 = Vector2.ZERO

@export var character: CharacterRes
@export var skills_ui: Array[SkillUI] = [null, null, null, null]
var skills: Array[Skill] = [null, null, null, null]

func _ready():
	if character:
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
			skills.append(skill)
	else:
		push_error("Character not defined in ", name)

func _unhandled_input(event: InputEvent):
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()

	# NOTE: Fazer um sistema pra detectar se sefine look_input com gamepad ou mouse
	if event is InputEventMouseMotion:
		look_input = (event.position - global_position).normalized()
	var gamepad_input = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
	if gamepad_input:
		look_input = gamepad_input
	if event.is_action_pressed("quit"):
		get_tree().quit()

	for i in range(0,4):
		if event.is_action_pressed("skill_" + str(i+1)):
			if skills[i]:
				skills[i].execute()

func _physics_process(_delta: float):
	velocity = move_input * SPEED

	move_and_slide()
