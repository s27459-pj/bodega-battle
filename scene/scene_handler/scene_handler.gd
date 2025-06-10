extends Node

func _ready():
	$MainMenu.visible = true
	$Settings.visible = false
	$HowToPlay.visible = false

	$MainMenu/MarginContainer/VBoxContainer/PlayButton.pressed.connect(on_new_game_pressed)
	$MainMenu/MarginContainer/VBoxContainer/ExitButton.pressed.connect(on_exit_pressed)
	$MainMenu/MarginContainer/VBoxContainer/SettingsButton.pressed.connect(func(): navigate("MainMenu", "Settings"))
	$MainMenu/MarginContainer/VBoxContainer/HowToPlayButton.pressed.connect(func(): navigate("MainMenu", "HowToPlay"))
	$Settings/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("Settings", "MainMenu"))
	$Settings/MarginContainer/VBoxContainer/VBoxContainer/Apply.pressed.connect(func():  button_click_sfx_effect())
	$HowToPlay/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("HowToPlay", "MainMenu"))

func button_click_sfx_effect():
	var click = preload("res://assets/audio/sound_effects/coin-collect-retro-8-bit-sound-effect-145251.mp3")
	$SFXPlayer.stream = click
	$SFXPlayer.play()

func on_new_game_pressed():
	button_click_sfx_effect()
	get_node("MainMenu").queue_free()
	var new_song = preload("res://assets/audio/music/the-wandering-samurai-344699.mp3")
	$MusicPlayer.stream = new_song
	$MusicPlayer.play()
	var game_scene = load("res://scene/level_main/GameScene.tscn").instantiate()
	add_child(game_scene)
	
func navigate(node, node_to_go):
	button_click_sfx_effect()
	get_node(node).visible = false
	get_node(node_to_go).visible = true

func on_exit_pressed():
	button_click_sfx_effect()
	get_tree().quit()
