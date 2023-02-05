extends AudioStreamPlayer



const build_music = preload("res://assets/music/BuildingMusic.mp3")
const action_music = preload("res://assets/music/ActionMusic.mp3")

func _ready():
	self.play(0.0)
	Store.connect("action_mode_changed", self, "action_mode_changed")


func action_mode_changed(action):
	if action:
		self.stream = action_music
	else:
		self.stream = build_music
