extends Node2D

const tower_prefab = preload("res://prefabs/Tower.tscn")

func _ready():
	Store.price_of_tower = 2
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and Store.is_settled:
		if (Store.resources >= Store.price_of_tower):
			spawn_tower(get_global_mouse_position())
		else:
			print("du har ikke råd :)")
		
		
func spawn_tower(position):
	Store.resources -= Store.price_of_tower
	Store.place_tower()
	var tower = tower_prefab.instance()
	tower.position = position
	get_parent().add_child(tower)
