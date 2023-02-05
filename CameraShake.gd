extends Camera2D

export var shake_power = 16
export var shake_time = 0.5
var is_shake = false
var curPos
var elapsedtime = 0

func _ready():
	randomize()
	curPos = offset
	Store.connect("camera_shake_signal", self, "camera_shake")

func _process(delta):
	if is_shake:
		shake(delta)    

func camera_shake():
	if !is_shake:
		elapsedtime = 0
		is_shake = true

func shake(delta):
	if elapsedtime<shake_time:
		offset =  Vector2(randf(), randf()) * shake_power
		elapsedtime += delta
	else:
		is_shake = false
		elapsedtime = 0
		offset = curPos   
