extends YSort

var x_movement = 648
var y_movement = 324
var ammount_to_move = 4
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_maps = self.get_children()
	for tile_map in tile_maps:
		tile_map.get_node("Area2D").connect("area_entered", self, "_on_Area2D_area_entered", [tile_map])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area, map_piece):
#	var map_piece = area.get_parent()
	var new_position = map_piece.global_position
	new_position += Vector2.RIGHT * x_movement * ammount_to_move
	new_position += Vector2.UP * y_movement * ammount_to_move
	print(":: ", map_piece)
	print("::: ", map_piece.global_position)
	map_piece.global_position = new_position
	print(":::: ", map_piece.global_position)
	print_debug(map_piece.to_string() + " should move")
