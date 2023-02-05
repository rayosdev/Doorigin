extends Sprite

const horse = preload("res://icon.png")
const base = preload("res://assets/Towers/Base.png")

func _ready():
	set_texture(horse)
	Store.connect("on_is_settled_change", self, "on_is_settled_change")
	pass


func on_is_settled_change(is_settled):
	if is_settled:
		set_texture(base)
	else:
		set_texture(horse)
