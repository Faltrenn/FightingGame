class_name ShowArea
extends Node2D


var mesh_instance := MeshInstance2D.new()
var timer := Timer.new()

func init(duration: float, mesh: Mesh, rotation_angle: float):
	mesh_instance.mesh = mesh
	mesh_instance.rotation = rotation_angle
	timer.one_shot = true
	timer.wait_time = duration
	timer.connect("timeout", queue_free)
	timer.start()

func change_color():
	mesh_instance.modulate = Color.BLUE

func _init():
	add_child(mesh_instance)
	add_child(timer)
