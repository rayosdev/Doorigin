extends Node



##
#	MULTI VARIABLES
##


onready var resources:Dictionary = {
	'wood': 1,
	'stone': 0,
	'food': 0,

} setget set_new_resource, get_resources
signal on_resources_change
func get_resources(): return resources
func set_new_resource(new_resource): 
	var key = Utils.diff_in_dictionery(resources, new_resource)
	emit_signal("on_resources_change", new_resource, resources, key)
	resources[key] = new_resource
func change_state_value(key:String, value):
	emit_signal("on_stat_single_value_change", key, value, resources[key])
	resources[key] = value


##
#	SINGEL VARIABLES
##


##
#	new_word_node_ref
##
onready var selected_ref:Node = null setget set_new_selected_ref, get_new_selected_ref
signal on_new_selected_ref_change
func get_new_selected_ref(): return selected_ref
func set_new_selected_ref(new_node_ref): 
	emit_signal("on_new_selected_ref_change", new_node_ref, selected_ref)
	selected_ref = new_node_ref
