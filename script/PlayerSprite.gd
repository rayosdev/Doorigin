extends Sprite

const horse_down = preload("res://assets/tile-resource/grid-based-sprites/Player_down.png")
const horse_up = preload("res://assets/tile-resource/grid-based-sprites/Player_up.png")
const horse_right = preload("res://assets/tile-resource/grid-based-sprites/Player_right.png")
const horse_left = preload("res://assets/tile-resource/grid-based-sprites/Player_left.png")
const base = preload("res://assets/Towers/Base.png")

func _ready():
	set_texture(horse_down)
	self.scale = Vector2(5, 5)
	Store.connect("on_is_settled_change", self, "on_is_settled_change")
	Store.connect("player_direction", self, "player_direction")
	pass


func on_is_settled_change(is_settled):
	if is_settled:
		self.scale = Vector2(0.5, 0.5)
		set_texture(base)
	else:
		self.scale = Vector2(5, 5)
		set_texture(horse_down)

func player_direction(direction):
	match direction:
		"left":
			set_texture(horse_left)
		"right":
			set_texture(horse_right)
		"down":
			set_texture(horse_down)
		"up":
			set_texture(horse_up)
	print(direction)
