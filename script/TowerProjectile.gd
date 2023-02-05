extends KinematicBody2D

var target_destination
var speed = 5

func _ready():
	pass

func set_target_destination(target):
	target_destination = target

func _physics_process(delta):
	move_and_slide(target_destination * speed)


func _on_Timer_timeout():
	queue_free()
