extends Node2D

const Tower = preload("res://prefabs/Tower.tscn")

var resources = 10


func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		print(event)
		var tower = Tower.instance()
		tower.position = get_global_mouse_position()
		get_parent().add_child(tower)
