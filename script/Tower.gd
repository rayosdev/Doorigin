extends AnimatedSprite


const radius = 10
var upgrades = []
var time_since_last_shot = Time.get_ticks_msec()

func _ready():
	print("lol")
	print(time_since_last_shot)
	pass

func _process(delta):
	pass
