extends Node3D
class_name Gamemanager

@export var ref: Refinery
@export var ui: UI


func _ready():
	if !ref.collected.is_connected(ui._on_PickedUp):
		ref.collected.connect(ui._on_PickedUp)
	
	
