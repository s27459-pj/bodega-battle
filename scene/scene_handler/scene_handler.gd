extends Node

var game_scene_node: Node2D = null

var click_sfx = preload("res://assets/audio/sound_effects/coin-collect-retro-8-bit-sound-effect-145251.mp3")

func _ready():
	$MainMenu.visible = true
	$Settings.visible = false
	$HowToPlay.visible = false

	$MainMenu/MarginContainer/VBoxContainer/PlayButton.pressed.connect(on_new_game_pressed)
	$MainMenu/MarginContainer/VBoxContainer/ExitButton.pressed.connect(on_exit_pressed)
	$MainMenu/MarginContainer/VBoxContainer/SettingsButton.pressed.connect(func(): navigate("MainMenu", "Settings"))
	$MainMenu/MarginContainer/VBoxContainer/HowToPlayButton.pressed.connect(func(): navigate("MainMenu", "HowToPlay"))

	$Settings/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("Settings", "MainMenu"))
	$Settings/MarginContainer/VBoxContainer/VBoxContainer/Apply.pressed.connect(func():  button_click_sfx())

	$HowToPlay/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("HowToPlay", "MainMenu"))

func button_click_sfx():
	$SFXPlayer.stream = click_sfx
	$SFXPlayer.play()

func on_new_game_pressed():
	button_click_sfx()
	$MainMenu.queue_free()
	$Settings.queue_free()
	$HowToPlay.queue_free()
	load_new_game()

func load_new_game():
	var new_song = preload("res://assets/audio/music/pixelated-dreams-328537.mp3")
	$MusicPlayer.stream = new_song
	$MusicPlayer.play()
	game_scene_node = load("res://scene/level_main/GameScene.tscn").instantiate()
	add_child(game_scene_node)
	GlobalVars.money = GlobalVars.starting_money

func unload_game():
	$MusicPlayer.stream = null
	$MusicPlayer.stop()
	game_scene_node.free()
	game_scene_node = null

func restart_game():
	unload_game()
	load_new_game()

func navigate(node, node_to_go):
	button_click_sfx()
	get_node(node).visible = false
	get_node(node_to_go).visible = true

func on_exit_pressed():
	button_click_sfx()
	get_tree().quit()
