extends Node2D

@onready var ui_health: Node2D = $"UI/UI-Health"
@onready var player_hit_trigger: Area2D = $LevelMain/PlayerHitTrigger
@onready var UI_prep : Control = $UI/Prep_phase_UI
@onready var auto_coin: Node = $AutoCoin

@export var ENEMY_MULTIPLAYER: int = 5

enum GameState { PREP, WAVE }
var state: GameState = GameState.PREP

func _ready() -> void:
	player_hit_trigger.set_HP_ref(ui_health)
	UI_prep.update_money(GlobalVars.money)
	GlobalVars.wave = 0
	GlobalVars.score = 0
	GlobalVars.Enemy_Death.connect(check_end_wave)
	enter_prep_phase()

func check_end_wave() -> void:
	if get_tree().get_node_count_in_group("enemies") == 1 and state == GameState.WAVE:
		auto_coin.pause_income();
		enter_prep_phase()

func enter_prep_phase():
	state = GameState.PREP
	var new_song = preload("res://assets/audio/music/pixelated-dreams-328537.mp3")
	GlobalAudio.play_music(new_song)
	UI_prep.show_prep_ui()
	UI_prep.check_win_screen()

func start_wave():
	auto_coin.start_income()
	UI_prep.hide_prep_ui()
	startNextWave()
	player_hit_trigger.set_HP_ref(ui_health)
	state = GameState.WAVE

## Enemy-Wave functions 
func startNextWave():
	GlobalVars.wave += 1
	GlobalVars.turret_damage_multiplier = GlobalVars.turret_damage_multiplier / (clampf(GlobalVars.wave/5, 1, GlobalVars.wave) ) #this is so there is no upper clamp 
	var waveData = getWaveData()
	await get_tree().create_timer(0.2).timeout
	spawnEnemies(waveData)
	
func getWaveData():
	var delay := clampf(2-(GlobalVars.wave/5),0.2,2)
	var waveData := [["basic-enemy",delay]]
	for i in range(ENEMY_MULTIPLAYER * GlobalVars.wave):
		waveData.append(["basic-enemy",delay])
	 
	#var waveData = [["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2],["basic-enemy",2]] # [nazwa_encji, dalay spawnu następnej encji]
	return waveData

func spawnEnemies(waveData):
	for e in waveData:
		# to jest raczej słabe rozwiązenie że on runtime coś loadujemy ale ¯\_(ツ)_/¯ 
		var new_enemy = load("res://objects/Enemies/" + e[0] +".tscn").instantiate()
		new_enemy.add_player_health_ref(ui_health)
		#print(new_enemy)
		$LevelMain.get_node("Enemy-path").add_child(new_enemy)
		await get_tree().create_timer(e[1]).timeout
