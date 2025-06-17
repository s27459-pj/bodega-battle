extends Node

var game_scene_node: Node2D = null

var click_sfx = preload("res://assets/audio/sound_effects/coin-collect-retro-8-bit-sound-effect-145251.mp3")

enum Difficulty {
	EASY,
	NORMAL,
	HARD,
}

func _ready():
	$MainMenu.visible = true
	$DifficultySelect.visible = false
	$Settings.visible = false
	$HowToPlay.visible = false

	$MainMenu/MarginContainer/VBoxContainer/PlayButton.pressed.connect(func(): navigate("MainMenu", "DifficultySelect"))
	$MainMenu/MarginContainer/VBoxContainer/ExitButton.pressed.connect(on_exit_pressed)
	$MainMenu/MarginContainer/VBoxContainer/SettingsButton.pressed.connect(func(): navigate("MainMenu", "Settings"))
	$MainMenu/MarginContainer/VBoxContainer/HowToPlayButton.pressed.connect(func(): navigate("MainMenu", "HowToPlay"))
	
	$DifficultySelect/MarginContainer/CharacterSelectContainer/Character1Button.pressed.connect(func(): select_character(1))
	$DifficultySelect/MarginContainer/CharacterSelectContainer/Character2Button.pressed.connect(func(): select_character(2))
	$DifficultySelect/MarginContainer/CharacterSelectContainer/BackButton.pressed.connect(func(): navigate("DifficultySelect", "MainMenu"))

	$DifficultySelect/MarginContainer/DifficultySelectContainer/EasyButton.pressed.connect(func(): start_new_game(Difficulty.EASY))
	$DifficultySelect/MarginContainer/DifficultySelectContainer/NormalButton.pressed.connect(func(): start_new_game(Difficulty.NORMAL))
	$DifficultySelect/MarginContainer/DifficultySelectContainer/HardButton.pressed.connect(func(): start_new_game(Difficulty.HARD))
	$DifficultySelect/MarginContainer/DifficultySelectContainer/BackButton.pressed.connect(func(): select_difficulty_cancel())

	$Settings/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("Settings", "MainMenu"))
	$Settings/MarginContainer/VBoxContainer/VBoxContainer/Apply.pressed.connect(func(): button_click_sfx())

	$HowToPlay/MarginContainer/Left/ArrowLeft.pressed.connect(func(): button_click_sfx())
	$HowToPlay/MarginContainer/Right/ArrowRight.pressed.connect(func(): button_click_sfx())
	$HowToPlay/MarginContainer/Center/BackButton.pressed.connect(func(): navigate("HowToPlay", "MainMenu"))

func button_click_sfx():
	$SFXPlayer.stream = click_sfx
	$SFXPlayer.play()

func select_character(idx: int):
	if idx == 1:
		GlobalVars.starting_money = 400
		GlobalVars.starting_health = 150
	elif idx == 2:
		GlobalVars.starting_money = 600
		GlobalVars.starting_health = 100

	button_click_sfx()
	$DifficultySelect/MarginContainer/CharacterSelectContainer.visible = false
	$DifficultySelect/MarginContainer/DifficultySelectContainer.visible = true

func select_difficulty_cancel():
	button_click_sfx()
	$DifficultySelect/MarginContainer/CharacterSelectContainer.visible = true
	$DifficultySelect/MarginContainer/DifficultySelectContainer.visible = false

func start_new_game(difficulty: Difficulty):
	if difficulty == Difficulty.EASY:
		GlobalVars.enemy_damage_multiplier = 0.8
		GlobalVars.turret_damage_multiplier = 1.1
	elif difficulty == Difficulty.NORMAL:
		GlobalVars.enemy_damage_multiplier = 1.0
		GlobalVars.turret_damage_multiplier = 1.0
	elif difficulty == Difficulty.HARD:
		GlobalVars.enemy_damage_multiplier = 1.2
		GlobalVars.turret_damage_multiplier = 0.9

	button_click_sfx()
	$MainMenu.queue_free()
	$DifficultySelect.queue_free()
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

func navigate(node_from, node_to):
	button_click_sfx()
	get_node(node_from).visible = false
	get_node(node_to).visible = true

func on_exit_pressed():
	button_click_sfx()
	get_tree().quit()
