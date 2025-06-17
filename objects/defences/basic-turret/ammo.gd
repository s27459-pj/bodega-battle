extends CharacterBody2D

var dir:float
var speed = 350
var color : Color

const damage_hit_sound = preload("res://assets/audio/sound_effects/bubble-pop-2-293341.mp3")

func _ready() -> void:
	color.r = randf_range(0.0, 1.0)
	color.g = randf_range(0.5, 1.0)
	color.b = randf_range(0.0, 1.0)
	modulate = color

func _physics_process(delta: float):
	velocity=Vector2(speed,0).rotated(dir)
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("enemies"):
			if collider.has_method("take_damage"):
				var base_damage = 10.0
				var damage = base_damage * GlobalVars.turret_damage_multiplier
				collider.take_damage(damage)
				GlobalAudio.play_sfx(damage_hit_sound)
			queue_free()
