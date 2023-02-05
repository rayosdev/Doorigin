extends AudioStreamPlayer



const shot = preload("res://assets/sfx/Kanontårn1.mp3")
const settle_sound = preload("res://assets/sfx/Tårn som blir oppgradert.mp3")

func _ready():
	self.autoplay = false
	self.play(0.0)
	Store.connect("on_is_settled_change", self, "on_is_settled_change")
	Store.connect("shoot", self, "shoot")


func on_is_settled_change(is_settled):
	if is_settled:
		settle_sound.loop = false
		self.stream = settle_sound
		self.play(0)

func shoot():
	shot.loop = false
	self.stream = shot
	self.play(0)
