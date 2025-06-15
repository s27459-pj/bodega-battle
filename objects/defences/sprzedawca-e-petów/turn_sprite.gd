extends AnimatedSprite2D

var detection_radius = 500

func _physics_process(delta: float) -> void:
	var enemie = get_closest_enemy()
	if enemie != null:
		var dir = to_local(enemie.global_transform.origin).normalized() #direction to enemy
		if dir.y > 0:
			print("is in front")
		else:
			print("is behind")
		if dir.x > 0:
			print("is right")
		else:
			print("is left")

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemies")
	var closest = null
	var closest_dist = detection_radius

	for enemy in enemies:
		if not enemy.has_method("get_global_position") and not ("global_position" in enemy):
			continue
		var dist = global_position.distance_to(enemy.global_position)
		if dist < closest_dist:
			closest = enemy
			closest_dist = dist
	return closest
