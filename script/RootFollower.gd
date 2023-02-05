extends Node2D
# warning-ignore:unused_signal
signal root_hit

export(NodePath) var target_object
onready var _target_object = get_node(target_object)

onready var bones = [
	$Skeleton2D/upper, $Skeleton2D/upper/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D/Bone2D/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D, $Skeleton2D/upper/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D/Bone2D
]

onready var anim = $Skeleton2D/AnimationPlayer

func _ready():
	anim.play("Idle")

func move_to_target(target: Vector2) -> void:

	var tween := create_tween()
	var target_distance_mod = bones[0].global_position.distance_to(target) * 0.002

	# scale bones
	for b in bones:
# warning-ignore:return_value_discarded
		tween.tween_property(b, "global_scale", Vector2(target_distance_mod,target_distance_mod), 0.1)

	# Move the last bone to target
	# warning-ignore:return_value_discarded
	tween.tween_property(bones[-1], "global_position", target, 0.1)

	# root bone rotation
	bones[0].look_at(target)
	bones[0].rotation -= 45.7 # this works for some reason lol


func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
#        move_to_target(get_global_mouse_position())
		$debugTarget.global_position = get_global_mouse_position()


func _on_UpdateTargetTimer_timeout():
	move_to_target(_target_object.global_position)

# warning-ignore:unused_argument
func _on_Area2D_area_entered(area:Area2D):
	print_debug(area.name)
	emit_signal("root_hit")
