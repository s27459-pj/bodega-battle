extends CharacterBody2D

@export var max_health := 100

@onready var health_bar = $HealthBar
@onready var fill_bar = $HealthBar/FillBar

var current_health := max_health

func _ready():
	add_to_group("enemies")
	update_health_bar()

func take_damage(amount):
	current_health = max(current_health - amount, 0)
	update_health_bar()
	if current_health == 0:
		queue_free()

func update_health_bar():
	var ratio = float(current_health) / float(max_health)
	fill_bar.size.x = ratio * health_bar.size.x


func set_health(value):
	current_health = clamp(value, 0, max_health)
	update_health_bar()

func _on_body_entered(body):
	if body.is_in_group("turret_bullets"):
		take_damage(body.damage)
		body.queue_free()
