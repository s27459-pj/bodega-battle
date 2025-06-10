extends CharacterBody2D

var dir:float
var speed=200

func _physics_process(delta: float):
	velocity=Vector2(speed,0).rotated(dir)
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("enemies"):
			if collider.has_method("take_damage"):
				collider.take_damage(10)
			queue_free()
	
