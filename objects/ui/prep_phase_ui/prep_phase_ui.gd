extends Control

@onready var start_wave_button = $StartWave
@onready var money_label = $MoneyLabel

func _ready():
	start_wave_button.pressed.connect(_on_start_wave_pressed)
	GlobalVars.money_changed.connect(update_money)
	update_money(GlobalVars.money)

func _on_start_wave_pressed():
	var new_song = preload("res://assets/audio/music/the-wandering-samurai-344699.mp3")
	var root_music_player = get_tree().root.get_node("SceneHandler/MusicPlayer")
	root_music_player.stream = new_song
	root_music_player.play()
	get_parent().get_parent().start_wave()

func update_money(value: int):
	money_label.text = str(value)

func show_prep_ui():
	start_wave_button.visible = true

func hide_prep_ui():
	start_wave_button.visible = false
