extends KinematicBody2D

var x_movement = 648
var y_movement = 324
var speed = 0.05
var move_direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	move_direction += Vector2.RIGHT * x_movement * speed
	move_direction += Vector2.UP * y_movement * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_direction = move_and_slide(move_direction)

