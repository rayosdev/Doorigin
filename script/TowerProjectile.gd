extends KinematicBody2D

var target_destination
var speed = 200

func _ready():
	pass

func set_target_destination(target):
	target_destination = target

func _physics_process(delta):
	global_position = global_position.move_toward(target_destination, delta*speed)
	#move_and_slide(target_destination.normalized() * speed)


func _on_Timer_timeout():
	queue_free()

func _on_Area2D_area_entered(area:Area2D):
	queue_free()
