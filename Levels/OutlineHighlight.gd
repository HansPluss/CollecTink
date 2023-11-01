extends RigidBody3D

@onready var targeted = true
@onready var SelectedShader = $MeshInstance3D.mesh.material.next_pass


func _process(_delta):
	
	if targeted:
		SelectedShader.set_shader_parameter("border_width", 0.2)
		
	else:
		SelectedShader.set_shader_parameter("border_width", 0.0)
# Called when the node enters the scene tree for the first time.

