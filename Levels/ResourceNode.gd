extends Area3D
var dimetalref = load("res://Prefabs/dimetal.tscn")
@export var DimetalObj: PackedScene
var rng = RandomNumberGenerator.new()
var stock = 5.0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _spawn_resource():
	var Dimetal = DimetalObj.instantiate()
	var rigid_body = RigidBody3D.new()
	#DimetalObj.add_child(rigid_body)
#	# Set the initial position of the spawned object
	var randomPosition_y = rng.randf_range(1.0,2.0)
	var randomPosition_x = rng.randf_range(-2.0,2.0)
	var randomPosition_z = rng.randf_range(-2.0,2.0)
	Dimetal.transform.origin = global_transform.origin + Vector3(randomPosition_x, randomPosition_y, randomPosition_z)
	owner.add_child(Dimetal)

func _on_body_entered(body):
	if body.is_in_group("Tool") and stock > 0:
		_spawn_resource()
		stock -= 1
		#Spawn a dimetal


func _on_timer_timeout():
	stock += 1
