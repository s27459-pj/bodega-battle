extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

func play_music(stream: AudioStream):
	music_player.stream = stream
	music_player.play()

func stop_music():
	music_player.stream = null
	music_player.stop()

func play_sfx(stream: AudioStream):
	sfx_player.stream = stream
	sfx_player.play()

const click_sfx = preload("res://assets/audio/sound_effects/coin-collect-retro-8-bit-sound-effect-145251.mp3")
func button_click_sfx():
	play_sfx(click_sfx)
