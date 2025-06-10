extends Control

func _on_apply_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($MarginContainer/VBoxContainer/VBoxContainer/MasterSlider.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($MarginContainer/VBoxContainer/VBoxContainer/MusicSlider.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($MarginContainer/VBoxContainer/VBoxContainer/SFXSlider.value))
