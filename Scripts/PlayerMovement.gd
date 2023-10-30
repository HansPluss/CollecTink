extends CharacterBody3D

var moveSpeed
const WALKSPEED = 5.0
const SPIRNTSPEED = 10.0
const JUMP_VELOCITY = 6.5
const SENSITIVITY = 0.01

const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head = $Head
@onready var camera = $Head/Camera3D

@onready var interaction = $Head/Camera3D/Interaction
@onready var hand = $Head/Camera3D/Hand
# Variables for object pickup
var picked_object
var pull_strength = 5.5



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
	if Input.is_action_just_pressed("leftClick"):
		if picked_object == null:
			_PickObjects()
		elif picked_object != null:
			_DropObjects()
		

func _PickObjects():
	var collider = interaction.get_collider()
	if collider != null and collider.is_in_group("pickable"):
		picked_object = collider
func _DropObjects():
	if picked_object != null:
		picked_object = null
func _process(_delta):
	if Input.is_action_just_pressed("ESC"):
		get_tree().quit()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("sprint"):
		moveSpeed = SPIRNTSPEED
	else:
		moveSpeed = WALKSPEED

	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackwards")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if is_on_floor():
		if direction:
			velocity.x = direction.x * moveSpeed
			velocity.z = direction.z * moveSpeed
		else:
			velocity.x = lerp(velocity.x, direction.x * moveSpeed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * moveSpeed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * moveSpeed, delta * 2.0)
		velocity.z = lerp(velocity.z, direction.z * moveSpeed, delta * 2.0)

	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	if picked_object != null:
		var a = picked_object.global_transform.origin
		var b = hand.global_transform.origin
		picked_object.set_linear_velocity((b-a) * pull_strength)

	move_and_slide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos




