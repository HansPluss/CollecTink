extends CanvasLayer
class_name UI

@onready var tink_label = %Tink

var tinks = 0:
	set(new_tinkAmount):
		tinks = new_tinkAmount
		_update_tink_label()
		
func _update_tink_label():
	tink_label.text = str(tinks)
	
func _ready():
	_update_tink_label()
	
func _on_PickedUp(tinkpickup) -> void:
	if(tinkpickup):
		tinks += 1
