extends Control

var resources:Label
var price_of_tower:Label

func _ready():
	resources = get_node(NodePath("ResourcesText"))
	price_of_tower = get_node(NodePath("PriceOfTowerText"))
	resources.text = str(Store.resources)
	price_of_tower.text = str(Store.price_of_tower)
	Store.connect("on_resources_change", self, "on_resources_change")
	Store.connect("on_price_of_tower_change", self, "on_price_of_tower_change")
	pass


func on_resources_change(resource):
	resources.text = str(resource)

func on_price_of_tower_change(price):
	price_of_tower.text = str(price)
