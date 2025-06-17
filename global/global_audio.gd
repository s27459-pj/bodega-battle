extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer


# Audio Bus
func _ready() -> void:
	var settings = Settings.load()
	for bus_idx in range(AudioServer.bus_count):
		var volume = settings.get_value("volume", str(bus_idx))
		if volume != null:
			AudioServer.set_bus_volume_db(bus_idx, volume)

func set_bus_volume_db(bus_idx: int, volume_db: float) -> void:
	AudioServer.set_bus_volume_db(bus_idx, volume_db)
	var settings = Settings.load()
	settings.set_value("volume", str(bus_idx), volume_db)
	Settings.save(settings)

func get_bus_volume_db(bus_idx: int) -> float:
	return AudioServer.get_bus_volume_db(bus_idx)


# Music
func play_music(stream: AudioStream):
	music_player.stream = stream
	music_player.play()

func stop_music():
	music_player.stream = null
	music_player.stop()


# SFX
func play_sfx(stream: AudioStream):
	sfx_player.stream = stream
	sfx_player.play()

const click_sfx = preload("res://assets/audio/sound_effects/coin-collect-retro-8-bit-sound-effect-145251.mp3")
func button_click_sfx():
	play_sfx(click_sfx)
