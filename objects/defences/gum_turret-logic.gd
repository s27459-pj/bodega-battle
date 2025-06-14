extends Node2D

@export var fire_rate = 2.0
@export var detection_radius = 300.0

@export var ammo_scene: PackedScene

var targetPosition : Vector2
var ammo_path = preload("res://assets/sprites/defences/gumball.png")
var shoot_timer := 0.0
var target: Node2D = null

func _process(delta):
	shoot_timer -= delta
	var enemies = get_tree().get_nodes_in_group("enemies")
	if not target or not is_instance_valid(target):
		target = get_closest_enemy()
		return

	if shoot_timer <= 0:
		shoot_at(target)
		shoot_timer = fire_rate


func activate():
	process_mode = Node.PROCESS_MODE_INHERIT


func deactivate():
	process_mode = Node.PROCESS_MODE_DISABLED


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


func shoot_at(enemy):
	var direction = (enemy.global_position - global_position).normalized()
	var ammo = ammo_scene.instantiate()
	ammo.global_position = global_position
	ammo.rotation = direction.angle()
	ammo.dir = direction.angle()
	get_parent().add_child(ammo)
