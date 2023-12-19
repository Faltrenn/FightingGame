extends Node

signal start
signal end

var timer: float = 0
var duration: float

func init(p_duration: float):
	duration = p_duration

func _ready():
	start.emit()

func _process(delta: float):
	timer += delta
	if timer >= duration:
		end.emit()
