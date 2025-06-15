extends Node


func set_tower_preview(tower_scene: PackedScene, mouse_position: Vector2) -> void:
	var tower_instance: Node2D = tower_scene.instantiate()
	tower_instance.deactivate()
	tower_instance.name = "DragTower"
	tower_instance.modulate = Color("ad54ff3c")

	var control = Control.new()
	control.add_child(tower_instance, true)
	control.set_position(mouse_position)
	control.set_name("TowerPreview")
	control.add_to_group("tower-preview")
	add_child(control, true)


func update_tower_preview(position: Vector2, color: Color) -> void:
	var control: Control = get_node("TowerPreview")
	control.set_position(position)
	
	var tower_instance: Node2D = control.get_node("DragTower")
	if tower_instance.modulate != color:
		tower_instance.modulate = color


func clear_tower_previews() -> void:
	var previews = get_tree().get_nodes_in_group("tower-preview")
	for preview in previews:
		preview.queue_free()
