extends Area2D

var tile_size = 16
var inputs = {
	"move_left": Vector2.LEFT,
	"move_right": Vector2.RIGHT,
	"move_up": Vector2.UP,
	"move_down": Vector2.DOWN}

onready var ray = $RayCast2D
onready var animation_player = $AnimationPlayer

var animation_speed = 3
var moving = false

var tower = preload("res://assets/tile-resource/grid-based-nodes/Tower.tscn")
var settled = false

func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	if moving || settled:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		animation_player.play(dir)
		tween.connect("finished", self, "_move_finished")

func _move_finished():
	moving = false

func _process(_delta):
	if !moving:
		if Input.is_action_just_pressed("place_tower"):
			var tower_instance = tower.instance()
			self.get_parent().add_child(tower_instance)
			tower_instance.position = position
		
		if Input.is_action_just_pressed("settle_base"):
			if settled:
				settled = false
				animation_player.play("move_up")
			else:
				animation_player.play("settled")
				settled = true
	
