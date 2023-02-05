extends KinematicBody2D

var x_movement = 648
var y_movement = 324
var speed = 0.05
var move_direction = Vector2.ZERO
var animation_state = 0
onready var animation_player = $Monster
var camera_shook = false

# Called when the node enters the scene tree for the first time.
func _ready():
	move_direction += Vector2.RIGHT * x_movement * speed
	move_direction += Vector2.UP * y_movement * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _physics_process(delta):
	if animation_state == 0:
		animation_player.play("monster_default")
	elif animation_state == 1:
		animation_player.play ("monster_left_up")
	elif animation_state == 2:
		animation_player.play ("monster_left_down")
		if !camera_shook:
			Store.shake_camera()
			camera_shook = true
		move_direction = move_and_slide(move_direction)
	elif animation_state == 3:
		animation_player.play ("monster_default")
	elif animation_state == 4:
		animation_player.play ("monster_right_up")
	elif animation_state == 5:
		animation_player.play ("monster_right_down")
		if !camera_shook:
			Store.shake_camera()
			camera_shook = true
		move_direction = move_and_slide(move_direction)
	else:
		animation_state = 0

func _on_Timer_timeout() -> void:
	animation_state += 1
	camera_shook = false
