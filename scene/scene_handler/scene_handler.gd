extends Node

func _ready():
	
	$MainMenu.visible = true
	$Settings.visible = false
	$HowToPlay.visible = false
	print($Settings/MarginContainer/VBoxContainer/BackButton)
	print($HowToPlay/MarginContainer/VBoxContainer/BackButton)
	$MainMenu/MarginContainer/VBoxContainer/PlayButton.pressed.connect(on_new_game_pressed)
	$MainMenu/MarginContainer/VBoxContainer/ExitButton.pressed.connect(on_exit_pressed)
	$MainMenu/MarginContainer/VBoxContainer/SettingsButton.pressed.connect(func(): navigate("MainMenu", "Settings"))
	$MainMenu/MarginContainer/VBoxContainer/HowToPlayButton.pressed.connect(func(): navigate("MainMenu", "HowToPlay"))
	$Settings/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("Settings", "MainMenu"))
	$HowToPlay/MarginContainer/VBoxContainer/BackButton.pressed.connect(func(): navigate("HowToPlay", "MainMenu"))

func on_new_game_pressed():
	get_node("MainMenu").queue_free()
	var game_scene = load("res://scene/default.tscn").instantiate()
	add_child(game_scene)
	
func navigate(node, node_to_go):
	get_node(node).visible = false
	get_node(node_to_go).visible = true

func on_exit_pressed():
	get_tree().quit()
