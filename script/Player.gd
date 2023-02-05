extends KinematicBody2D

export(float) var MAX_SPEED = 105.0
onready var navigation_agent = $NavigationAgent2D
var velocity = Vector2.ZERO
var last_move_velocity = Vector2.ZERO
var move_direction = Vector2.ZERO

var sprite

func _ready():
	set_target_location(position)

func _process(_delta):
	if Input.is_action_just_pressed("settle_base"):
		set_target_location(get_position())
		Store.toggle_is_settled()

func set_target_location(target:Vector2) -> void:
	navigation_agent.set_target_location(target)

func _physics_process(_delta):
	if Input.is_action_just_pressed("player_move") and !Store.is_settled:
		set_target_location(get_global_mouse_position())
	
	move_direction = position.direction_to(navigation_agent.get_next_location())
	velocity = move_direction * MAX_SPEED
	navigation_agent.set_velocity(velocity)
	
	if not _arrived_at_location():
		velocity = move_and_slide(velocity)

func _arrived_at_location() -> bool:
	return navigation_agent.is_navigation_finished()

