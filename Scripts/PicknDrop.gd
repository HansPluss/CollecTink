extends RayCast3D

var carryingObject : Object = null
var carryDistance : float = 5.0
var t
var looking_at = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if is_colliding():
		var collider = get_collider()
		#print("col groups:", collider.get_groups())
		if(collider != null && collider.is_in_group("pickable")):
			#print("bruh")
			pass
	var coll = get_collider()
	if coll != looking_at:
		if coll != null and "targeted" in coll:
			coll.targeted = true
		
		if looking_at != null and "targeted" in looking_at:
			looking_at.targeted = false
		
		
	looking_at = coll
	


func _unhandled_input(event):
	if event is InputEventMouseButton and Input.is_action_just_pressed("leftClick") and event.pressed:
		if carryingObject == null:
			# If not carrying an object, try to pick up an object
			_tryPickupObject()
		else:
			# If carrying an object, drop it
			_dropObject()
			

func _tryPickupObject():
	pass
	#carryingObject.set_physics_process(false)  # Disable physics processing while carrying
	#carryingObject.set_parent(self.transform)  # Make the player the parent of the picked-up object
func _dropObject():
	
	
	if carryingObject != null:
		carryingObject.set_physics_process(true)  # Enable physics processing
		carryingObject.set_parent(null)  # Unparent the object
		carryingObject = null
