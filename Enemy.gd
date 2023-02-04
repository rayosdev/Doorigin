extends KinematicBody2D

signal target_reached

export(float) var MAX_SPEED = 105.0

onready var navigation_agent = $NavigationAgent2D

var velocity = Vector2.ZERO
var last_move_velocity = Vector2.ZERO
var move_direction = Vector2.ZERO
var did_arrive = false
var player

func _ready():
	# ensure villagers are initially set to their origin
	set_target_location(position)
	
func _unhandled_input(event):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	set_target_location(event.global_position)

func set_target_location(target:Vector2) -> void:
	did_arrive = false
	navigation_agent.set_target_location(target)

func _physics_process(_delta):
	move_direction = position.direction_to(navigation_agent.get_next_location())
	velocity = move_direction * MAX_SPEED
	navigation_agent.set_velocity(velocity)
	
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)
	elif not did_arrive:
		did_arrive = true
		emit_signal("target_reached")
		
func _arrived_at_location() -> bool:
	return navigation_agent.is_navigation_finished()
