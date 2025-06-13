extends Node2D

@onready var ui_health: Node2D = $"UI-Health"

func _ready() -> void:
	startNextWave()

## Enemy-Wave functions 
func startNextWave():
	var waveData = getWaveData()
	await get_tree().create_timer(0.2).timeout
	spawnEnemies(waveData)
	
func getWaveData():
	var waveData = [["basic-enemy",2],["basic-enemy",2]] # [nazwa_encji, dalay spawnu następnej encji]
	return waveData

func spawnEnemies(waveData):
	for e in waveData:
		# to jest raczej słabe rozwiązenie że on runtime coś loadujemy ale ¯\_(ツ)_/¯ 
		var new_enemy = load("res://objects/Enemies/" + e[0] +".tscn").instantiate()
		new_enemy.add_player_health_ref(ui_health)
		#print(new_enemy)
		$LevelMain.get_node("Enemy-path").add_child(new_enemy)
		await get_tree().create_timer(e[1]).timeout
