extends Node


onready var is_settled:bool = false setget set_is_settled, get_is_settled
signal on_is_settled_change
func get_is_settled(): return is_settled
func set_is_settled(new_is_settled):
	emit_signal("on_is_settled_change", new_is_settled)
	is_settled = new_is_settled
func toggle_is_settled():
	set_is_settled(!is_settled)

onready var resources:int = 10 setget set_new_resource, get_resources
signal on_resources_change
func get_resources(): return resources
func set_new_resource(new_resource):
	emit_signal("on_resources_change", new_resource)
	resources = new_resource
func add_resources(amount):
	resources += amount


var towers_placed:int = 0
onready var price_of_tower:int = 2 setget set_price_of_tower, get_price_of_tower
signal on_price_of_tower_change
func place_tower():
	towers_placed += 1
	set_price_of_tower(2 + towers_placed)
func get_price_of_tower(): return price_of_tower
func set_price_of_tower(new_price_of_tower):
	emit_signal("on_price_of_tower_change", new_price_of_tower)
	price_of_tower = new_price_of_tower

signal camera_shake_signal
func shake_camera():
	emit_signal("camera_shake_signal")
