class_name Player extends CharacterBody2D


const SPEED := 300.0

var move_input : Vector2:
	get:
		return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
var look_input : Vector2:
	get: # NOTE: Fazer um sistema pra detectar se sefine look_input com gamepad ou mouse
		var input = Input.get_vector("look_left", "look_right", "look_up", "look_down").normalized()
		return input if input else (get_viewport().get_mouse_position() - global_position).normalized()
var mouse_position : Vector2

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
	if event.is_action_pressed("quit"):
		get_tree().quit()

	for i in range(0,4):
		if event.is_action_pressed("skill_" + str(i+1)):
			if skills[i]:
				skills[i].execute()

func _physics_process(_delta: float):
	velocity = move_input * SPEED

	move_and_slide()
