extends PathFollow2D

@export var speed = 200
@export var push_back_on_hurt := 5
var player_hp_reference :Node2D

func _physics_process(delta: float) -> void:
	move(delta)
	
func move(delta: float) -> void:
	progress += speed* delta

func move_hurt() -> void:
	progress = max(0, progress-push_back_on_hurt) 

func add_player_health_ref(hp : Node2D):
	player_hp_reference = hp 
	
func damage_player():
	player_hp_reference.has_method("damage_player")
	player_hp_reference.damage_player(10)
