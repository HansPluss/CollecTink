extends CollisionShape3D
class_name Refinery
signal collected(pickupable)
signal collectMetal(metalPickup)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("pickable"):
		if body.is_in_group("Tink"):
			_onTinkCollect(self)
			body.queue_free()
		elif body.is_in_group("Dimetal"):
			_onMetalCollect(self)
			body.queue_free()

func _onTinkCollect(pickupable):
	collected.emit(pickupable)
func _onMetalCollect(metalPickup):
	collectMetal.emit(metalPickup)
	
