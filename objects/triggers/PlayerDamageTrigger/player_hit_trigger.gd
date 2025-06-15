extends Area2D

@export var healthBar : Node2D

func set_HP_ref(hp:Node2D):
	healthBar = hp
	print(healthBar)

func _ready() -> void:
	add_to_group("Enemy_Won_Space")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
		if healthBar.has_method("damage_player"):
			healthBar.damage_player(10)
