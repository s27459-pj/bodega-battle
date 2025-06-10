extends Control



func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/MasterSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$MarginContainer/VBoxContainer/VBoxContainer/MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$MarginContainer/VBoxContainer/VBoxContainer/SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_master_slider_mouse_exited(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	
func _on_music_slider_mouse_exited(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	
func _on_sfx_slider_mouse_exited(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	
