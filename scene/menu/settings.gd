extends Control

@onready var sliders = {
	0: $MarginContainer/VBoxContainer/VBoxContainer/MasterSlider,
	1: $MarginContainer/VBoxContainer/VBoxContainer/MusicSlider,
	2: $MarginContainer/VBoxContainer/VBoxContainer/SFXSlider,
}

func _ready() -> void:
	load_slider_values()

func _on_apply_pressed() -> void:
	for bus_idx in sliders:
		var slider_value = sliders[bus_idx].value
		GlobalAudio.set_bus_volume_db(bus_idx, linear_to_db(slider_value))

func load_slider_values() -> void:
	for bus_idx in sliders:
		var bus_value = GlobalAudio.get_bus_volume_db(bus_idx)
		sliders[bus_idx].value = db_to_linear(bus_value)
