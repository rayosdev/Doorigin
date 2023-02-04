extends Node2D

export(Resource) var EnemyScene

export(NodePath) var FullCreepTarget# = $UpperAdvance
onready var BaseOrigin = $BaseOrigin
onready var BaseBone = $Skeleton2D/Bone2D # advance this one to move the base
onready var SpawnLocations = $Skeleton2D/Bone2D/SpawnLocations

var creep_prc = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_advanceBase()

func _spawnEnemy():
	var spawn_locations = SpawnLocations.get_children() 
	var selected_spawn = spawn_locations[randi() % spawn_locations.size()]
	var enemy = EnemyScene.instance()
	self.add_child(enemy)
	enemy.global_position = selected_spawn.global_position


func _advanceBase():
	# get the distances
	#var totAdvancesDistance = BaseOrigin.global_position.distance_to(FullCreepTarget.global_position)
	#var currAdvanceDistance = BaseOrigin.global_position.distance_to(BaseBone)

	# difference between start and max
	var diffVector = get_node(FullCreepTarget).global_position - BaseOrigin.global_position

	var new_position = BaseOrigin.global_position + ((diffVector * creep_prc) / 100)

	#print('Base is advancing!' + str(diffVector))

	# Finally move to new position
	var tween = create_tween()
	tween.tween_property(BaseBone, "global_position", new_position, 1)

	# Finally increment the creep amount
	if creep_prc != 100:
		creep_prc += 10

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		_advanceBase()
		_spawnEnemy()
