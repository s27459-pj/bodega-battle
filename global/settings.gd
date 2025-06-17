extends Node

const settings_path = "user://settings.ini"

func load() -> ConfigFile:
	var config = ConfigFile.new()
	config.load(settings_path)
	return config

func save(settings: ConfigFile) -> void:
	settings.save(settings_path)
