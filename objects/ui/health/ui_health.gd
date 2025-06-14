extends Node2D
@export var maxHealth := 100 
@export var game_scene: Node2D

@onready var hp_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	hp_bar.max_value = maxHealth
	hp_bar.value = maxHealth

func damage_player(dmg : int)-> void: 
	hp_bar.value -= clamp(dmg, 0, maxHealth)
	check_game_over()

func check_game_over() -> void:
	#print("debug: current hp:" + str(hp_bar.value))
	if (hp_bar.value == 0): 
		game_over()

#game over sequence 
func game_over():
	game_scene.get_tree().reload_current_scene()
