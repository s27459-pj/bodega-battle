extends Node

# Enemy
@export var gum_turret_price = 100
@export var vape_turret_price = 500

# UI
@export var starting_money = 500;
@export var money = starting_money:
	set(value):
		money = value
		money_changed.emit(money)

signal money_changed

@export var auto_coin_timer = 1.0
