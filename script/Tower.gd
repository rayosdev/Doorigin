extends Sprite


const radius = 10
var upgrades = []
var time_since_last_shot = Time.get_ticks_msec()
const time_between_shots = 1000 #in ms

func _process(_delta):
	if (Time.get_ticks_msec() > (time_since_last_shot + time_between_shots)):
		shoot()
		time_since_last_shot = Time.get_ticks_msec()

func shoot():
	#print("pew pew!")
	pass
