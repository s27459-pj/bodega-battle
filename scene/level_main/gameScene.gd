extends Node2D

@onready var ui_health: Node2D = $"UI-Health"
@onready var player_hit_trigger: Area2D = $LevelMain/PlayerHitTrigger
@onready var UI_prep : Control = $CanvasLayer/Prep_phase_UI

@export var UI_health: Node2D

enum GameState { PREP, WAVE }
var state: GameState = GameState.PREP

func _ready() -> void:
	print(UI_prep)
	player_hit_trigger.set_HP_ref(ui_health)
	UI_prep.update_money(100)
	enter_prep_phase()

func enter_prep_phase():
	state = GameState.PREP
	UI_prep.show_prep_ui()

func start_wave():
	state = GameState.WAVE
	UI_prep.hide_prep_ui()
	startNextWave()
	player_hit_trigger.set_HP_ref(UI_health)

## Enemy-Wave functions 
func startNextWave():
	var waveData = getWaveData()
	await get_tree().create_timer(0.2).timeout
	spawnEnemies(waveData)
	
func getWaveData():
	var waveData = [["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2]] # [nazwa_encji, dalay spawnu następnej encji]
	return waveData

func spawnEnemies(waveData):
	for e in waveData:
		# to jest raczej słabe rozwiązenie że on runtime coś loadujemy ale ¯\_(ツ)_/¯ 
		var new_enemy = load("res://objects/Enemies/" + e[0] +".tscn").instantiate()
		new_enemy.add_player_health_ref(ui_health)
		#print(new_enemy)
		$LevelMain.get_node("Enemy-path").add_child(new_enemy)
		await get_tree().create_timer(e[1]).timeout
