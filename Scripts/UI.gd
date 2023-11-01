extends CanvasLayer
class_name UI
var save_path = "user://variable.save"
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
	_load_data()
func _on_PickedUp(tinkpickup) -> void:
	if(tinkpickup):
		tinks += 1
		_save()
func _on_PickedUpDim(dimpickup) -> void:
	if(dimpickup):
		dimetal += 1
		_save()
		
func _save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(tinks)
	file.store_var(dimetal)
func _load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		if file != null:
			tinks = int(file.get_var(tinks))
			dimetal = int(file.get_var(dimetal))
			file.close()
	else:
		print("No save data found!")
		tinks = 0
		dimetal = 0
