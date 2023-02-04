extends Node2D


export var SPEED = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var dir:Vector2
#	if Input.is_action_pressed("move_right")	: dir.x = 1
#	if Input.is_action_pressed("move_left")		: dir.x = -1
#	if Input.is_action_pressed("move_down")		: dir.y = 1
#	if Input.is_action_pressed("move_up")		: dir.y = -1
#
#	position += dir * SPEED * delta
	pass

func _input(event):
	if event is InputEventMouseButton:
#		globa
		pass
