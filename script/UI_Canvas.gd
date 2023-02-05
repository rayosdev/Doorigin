extends Control

var resources:Label
var price_of_tower:Label
var settled:Label

func _ready():
	resources = get_node(NodePath("ResourcesText"))
	price_of_tower = get_node(NodePath("PriceOfTowerText"))
	settled = get_node(NodePath("SettledText"))
	on_resources_change(Store.resources)
	on_price_of_tower_change(Store.price_of_tower)
	on_is_settled_change(Store.is_settled)
# warning-ignore:return_value_discarded
	Store.connect("on_resources_change", self, "on_resources_change")
# warning-ignore:return_value_discarded
	Store.connect("on_price_of_tower_change", self, "on_price_of_tower_change")
# warning-ignore:return_value_discarded
	Store.connect("on_is_settled_change", self, "on_is_settled_change")
	pass


func on_resources_change(resource):
	resources.text = str(resource)

func on_price_of_tower_change(price):
	price_of_tower.text = str(price)

func on_is_settled_change(is_settled):
	if is_settled:
		settled.text = "settled"
	else:
		settled.text = "not settled"
