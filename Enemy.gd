extends KinematicBody2D

export(float) var MAX_SPEED = 20.0
onready var navigation_agent = $NavigationAgent2D
var velocity = Vector2.ZERO
var last_move_velocity = Vector2.ZERO
var move_direction = Vector2.ZERO
var original_position
var player
onready var pursue_timer = $Timer
var wait_at_home = true
var waiting = false

func _ready():
	original_position = position
	player = get_parent().find_node("Player")
	set_target_location(original_position)

func set_target_location(target:Vector2) -> void:
	navigation_agent.set_target_location(target)

func _physics_process(_delta):
	move_direction = position.direction_to(navigation_agent.get_next_location())
	velocity = move_direction * MAX_SPEED
	navigation_agent.set_velocity(velocity)
	
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)
	elif !wait_at_home :
		set_target_location(player.position)
	elif !waiting:
		waiting = true
		pursue_timer.wait_time = 2
		pursue_timer.start()

func _arrived_at_location() -> bool:
	return navigation_agent.is_navigation_finished()

func on_root_hurt():
	set_target_location(original_position)
	wait_at_home = true

func _on_Area2D_area_entered(_area):
	print_debug("enemy retreat")
	on_root_hurt()

func _on_Timer_timeout():
	set_target_location(player.position)
	wait_at_home = false
	waiting = false
