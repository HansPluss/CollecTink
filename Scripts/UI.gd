extends CanvasLayer
class_name UI

@onready var tink_label = %Tink
@onready var dimetal_label = %Dimetal2

var dimetal = 0:
	set(new_dimetalAmount):
		dimetal = new_dimetalAmount
		_update_dimetal_label()

var tinks = 0:
	set(new_tinkAmount):
		tinks = new_tinkAmount
		_update_tink_label()
		
func _update_tink_label():
	tink_label.text = str(tinks)
func _update_dimetal_label():
	dimetal_label.text = str(dimetal)
func _ready():
	_update_tink_label()
	_update_dimetal_label()
func _on_PickedUp(tinkpickup) -> void:
	if(tinkpickup):
		tinks += 1
func _on_PickedUpDim(dimpickup) -> void:
	if(dimpickup):
		dimetal += 1
		
