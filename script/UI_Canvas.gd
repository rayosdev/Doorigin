extends Control

var resources:Label
var price_of_tower:Label
var score_label:Label
#var settled:Label

export(NodePath) var resources_label_node
export(NodePath) var price_of_tower_label_node
export(NodePath) var score_label_node

func _ready():
	print("Loading UI!")
	resources = get_node(resources_label_node)
	price_of_tower = get_node(price_of_tower_label_node)
	score_label = get_node(score_label_node)
	#settled = get_node(NodePath("SettledText"))
	on_resources_change(Store.resources)
	on_price_of_tower_change(Store.price_of_tower)
	#on_is_settled_change(Store.is_settled)
# warning-ignore:return_value_discarded
	Store.connect("on_resources_change", self, "on_resources_change")
# warning-ignore:return_value_discarded
	Store.connect("on_price_of_tower_change", self, "on_price_of_tower_change")
	
	Store.connect("on_score_change", self, "on_score_change")
# warning-ignore:return_value_discarded
	#Store.connect("on_is_settled_change", self, "on_is_settled_change")
	#pass


func on_resources_change(resource):
	resources.text = str(resource)

func on_price_of_tower_change(price):
	price_of_tower.text = str(price)

func on_score_change(score):
	score_label.text = str(score)
