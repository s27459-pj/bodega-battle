extends CharacterBody2D

var dir:float
var speed = 350

func _physics_process(delta: float):
	velocity=Vector2(speed,0).rotated(dir)
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("enemies"):
			if collider.has_method("take_damage"):
				collider.take_damage(10)
				damage_SFX()
			queue_free()

func damage_SFX():
	var sfx_player = get_tree().root.get_node("SceneHandler/SFXPlayer")
	var hit_sound = preload("res://assets/audio/sound_effects/bubble-pop-2-293341.mp3")
	if sfx_player:
		sfx_player.stream = hit_sound
		sfx_player.play()
