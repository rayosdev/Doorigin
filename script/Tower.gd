extends Sprite


export var radius = 500
var upgrades = []
var time_since_last_shot = Time.get_ticks_msec()
const time_between_shots = 1000 #in ms

var projectile = preload("res://prefabs/TowerProjectile.tscn")

func _process(_delta):
	if (Time.get_ticks_msec() > (time_since_last_shot + time_between_shots)):
		shoot()
		time_since_last_shot = Time.get_ticks_msec()

func shoot():
	var enemy = find_closest_enemy()
	if enemy:
		var projectile_instance = projectile.instance()
		self.get_parent().add_child(projectile_instance)
		projectile_instance.position = position
		projectile_instance.set_target_destination(enemy.global_position)

func find_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("Enemies")
	print_debug(enemies)
	for enemy in enemies:
		if position.distance_to(enemy.global_position) < radius:
			return enemy


func _on_Area2D_area_entered(area:Area2D):
	queue_free()
