extends CharacterBody3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	pass
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= (gravity * delta)/4
		
		
		
	move_and_slide()
