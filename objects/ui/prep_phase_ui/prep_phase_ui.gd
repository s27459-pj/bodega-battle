extends Control

@onready var start_wave_button = $StartWave
@onready var money_label = $MoneyLabel
@onready var win_labels: Control = $"win labels"

func _ready():
	start_wave_button.pressed.connect(_on_start_wave_pressed)
	GlobalVars.money_changed.connect(update_money)
	update_money(GlobalVars.money)

func check_win_screen():
	if (GlobalVars.wave == 4): 
		win_labels.visible = true

func _on_start_wave_pressed():
	win_labels.visible = false
	var new_song = preload("res://assets/audio/music/the-wandering-samurai-344699.mp3")
	GlobalAudio.play_music(new_song)
	get_parent().get_parent().start_wave()

func update_money(value: int):
	money_label.text = str(value)

func show_prep_ui():
	start_wave_button.visible = true

func hide_prep_ui():
	start_wave_button.visible = false
