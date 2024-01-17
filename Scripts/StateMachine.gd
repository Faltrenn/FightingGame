class_name StateMachine extends Node


@export var current_state: State

func _init():
	for child in get_children():
		if child is State:
			child.state_machine = self
		else:
			push_warning("Child is not a compatible state in ", name)
	current_state.enter()

func _unhandled_input(event: InputEvent):
	current_state.input(event)

func _process(delta: float):
	current_state.update(delta)

func _physics_process(delta: float):
	current_state.physics_update(delta)

func has_state(name: String) -> State:
	for child in get_children():
		if child.name == name:
			return child
	return null

func transition(to_state: String, msg := {}):
	var state = has_state(to_state)
	if state:
		current_state.exit()
		state.enter(msg)
		current_state = state
