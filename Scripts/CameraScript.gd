extends Camera3D

@export var camera_path : NodePath


var camera : Camera3D
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node(camera_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_transform = camera.global_transform
