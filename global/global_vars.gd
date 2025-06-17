extends Node

# Defense Turrets
@export var gum_turret_price = 100
@export var gum_turret_upgrade_price = 1000

@export var vape_turret_price = 500
@export var vape_turret_upgrade_price = 2000

# Difficulty
@export var enemy_damage_multiplier = 1.0
@export var turret_damage_multiplier = 1.0

# Money
@export var starting_money = 500;
@export var money = starting_money:
	set(value):
		money = value
		money_changed.emit(money)

signal money_changed

@export var auto_coin_timer = 1.0

# Health
@export var starting_health = 100;

# wave 
@export var wave := 0;

# enemy death 
signal Enemy_Death 

# Score
@export var score : int = 0:
	set(value):
		score = value
		score_changed.emit(score)
	

signal score_changed(score : int)
