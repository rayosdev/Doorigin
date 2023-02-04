extends Node2D

const Tower = preload("res://prefabs/Tower.tscn")

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if (Store.resources >= Store.price_of_tower):
			spawn_tower(get_global_mouse_position())
		else:
			print("du har ikke råd :)")
		
		
func spawn_tower(position):
	Store.resources -= Store.price_of_tower
	Store.place_tower()
	var tower = Tower.instance()
	tower.position = position
	get_parent().add_child(tower)
	print("current resources: " + str(Store.resources))
	print("price of new tower: " + str(Store.price_of_tower))