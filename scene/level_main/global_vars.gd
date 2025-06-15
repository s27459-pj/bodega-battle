extends Node

# Enemy
@export var gum_turret_price = 100
@export var vape_turret_price = 500

# UI
@export var money = 500:
	set(value):
		money = value
		money_changed.emit(money)

signal money_changed

@export var auto_coin_timer = 1.0
