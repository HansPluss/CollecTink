extends Node3D


var tinkRef = load("res://Prefabs/TinkSphere.tscn")
var testtink = load("res://Prefabs/test_tink.tscn")
@export var TinkObj: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Input.is_action_just_pressed("leftClick"):
		pass
func _SpawnTink():
	pass
#	var tinko = TinkObj.instantiate()
#	var rigid_body = RigidBody3D.new()
#	tinko.add_child(rigid_body)
#	# Set the initial position of the spawned object
#	tinko.transform.origin = global_transform.origin + Vector3(0, -5, 0)
	# Ensure the spawned object has a CollisionShape

	
	#tinko.transform = self.transform
	#owner.add_child(tinko)


func _on_timer_timeout():
	_SpawnTink() # Replace with function body.
