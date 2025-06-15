extends Node

@onready var timer: Timer = $CoinTimer

func _ready():
	timer.wait_time = GlobalVars.auto_coin_timer
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	GlobalVars.money += 1
	
func pause_income():
	timer.stop()

func start_income():
	timer.start()
