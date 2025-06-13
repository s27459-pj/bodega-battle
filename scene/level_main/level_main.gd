extends Node2D

@export var UI_health: Node2D
@onready var player_hit_trigger: Area2D = $PlayerHitTrigger

func _ready() -> void:
	player_hit_trigger.set_HP_ref(UI_health)
