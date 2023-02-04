extends Node2D

export(NodePath) var target_node
onready var _target_object = get_node(target_node)
export(int) var SPEED = 200 # Change this to increase it to more units/second

func _ready():
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		print("Found the player, targetting!")
		_target_object = players[0] # select a random player node
		
	

func _process(delta):
	$Area2D.global_position = $Area2D.global_position.move_toward(_target_object.global_position, delta * SPEED)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
#		move_to_target(get_global_mouse_position())
		$DebugTarget2D.global_position = get_global_mouse_position()
		#move_to_target(_target_object.global_position)
