extends Area2D

@export var healthBar : Node2D

func set_HP_ref(hp:Node2D):
	healthBar = hp

func _ready() -> void:
	add_to_group("Enemy_Won_Space")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(body.current_health)
		if healthBar.has_method("damage_player"):
			var base_damage = 10.0
			var damage = base_damage * GlobalVars.enemy_damage_multiplier
			healthBar.damage_player(damage)
