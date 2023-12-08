extends VSlider

# Definitions

@export var busName: String
var busIndex : int

func _ready():
	busIndex = AudioServer.get_bus_index(busName)
	value_changed.connect(_on_value_changed)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(busIndex))


@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value):
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))


func _on_mouse_exited():
	self.release_focus()
