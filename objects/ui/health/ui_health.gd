extends Node2D
@export var maxHealth := 100 

@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.max_value = maxHealth
	progress_bar.value = maxHealth

func damage_player(dmg : int)-> void: 
	progress_bar.value -= dmg
