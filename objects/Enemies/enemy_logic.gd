extends CharacterBody2D

@export var max_health := 100

@onready var health_bar = $HealthBar
@onready var fill_bar = $HealthBar/FillBar
@onready var basic_enemie: PathFollow2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var current_health := max_health

func _ready():
	add_to_group("enemies")
	update_health_bar()

func take_damage(amount):
	current_health = max(current_health - amount, 0)
	update_health_bar()
	basic_enemie.move_hurt()
	animation_player.play("hit")
	if current_health == 0:
		GlobalVars.money += 10
		GlobalVars.score += 1
		animation_player.stop()
		animation_player.play("death")

func update_health_bar():
	var ratio = float(current_health) / float(max_health)
	fill_bar.size.x = ratio * health_bar.size.x

func set_health(value):
	current_health = clamp(value, 0, max_health)
	update_health_bar()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()
