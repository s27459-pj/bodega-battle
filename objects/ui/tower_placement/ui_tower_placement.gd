extends Node2D

@export var overlay: Node
@export var level: Node

# Are we currently building a tower?
var build_mode: bool = false
# Is the current build location valid?
var build_valid: bool = false
# The type of tower we're currently building
var building_scene: PackedScene
# Where we're building the tower
var build_location: Vector2

var gum_turret_scene: PackedScene = load("res://objects/defences/basic-turret/gum-turret.tscn")
var vape_turret_scene: PackedScene = load("res://objects/defences/sprzedawca-e-petów/cigaret.tscn")

var buildable_spots_tilemap: TileMapLayer


func _ready() -> void:
	buildable_spots_tilemap = level.get_node("TileMap/BuildSpots")


func _process(delta: float) -> void:
	if get_viewport().gui_get_hovered_control() != null:
		return
	if build_mode:
		update_tower_preview()

		if Input.is_action_just_released("ui_accept"):
			if verify_and_build():
				# Only exit build mode if we had a successful tower placement
				cancel_build_mode()
		elif Input.is_action_just_released("ui_cancel"):
			# TODO: Don't pause the game if we're in build mode
			cancel_build_mode()

	else:
		if Input.is_action_just_pressed("ui_tower_start_build"):
			if Input.is_key_pressed(KEY_1):
				initiate_build_mode(gum_turret_scene)
			if Input.is_key_pressed(KEY_2):
				initiate_build_mode(vape_turret_scene)
			# NOTE: Add more tower shortcuts from:
			#       Project Settings >Input Map > ui_tower_start_build


func _on_gum_turret_button_pressed() -> void:
	initiate_build_mode(gum_turret_scene)


func _on_vape_turret_button_pressed() -> void:
	initiate_build_mode(vape_turret_scene)


func initiate_build_mode(scene: PackedScene) -> void:
	if build_mode:
		return
	
	if GlobalVars.money < get_turret_cost(scene):
		return

	build_mode = true
	building_scene = scene
	overlay.set_tower_preview(building_scene, get_global_mouse_position())


func update_tower_preview() -> void:
	var mouse_position = get_global_mouse_position()

	# Account for the tilemap scale when converting from global to map coordinates
	var current_tile = get_tile_coord_scaled(mouse_position, buildable_spots_tilemap)

	# Convert map coordinates back to world coordinates (this will be correct scale)
	var tile_position = buildable_spots_tilemap.map_to_local(current_tile) * buildable_spots_tilemap.scale

	# If there is a tile in the BuildSpots tilemap, we can build there
	build_valid = buildable_spots_tilemap.get_cell_source_id(current_tile) != -1
	if build_valid:
		overlay.update_tower_preview(tile_position, Color("adff45aa"))
		build_location = tile_position
	else:
		overlay.update_tower_preview(tile_position, Color("ad54ffaa"))


func cancel_build_mode() -> void:
	build_mode = false
	build_valid = false
	overlay.clear_tower_previews()


func verify_and_build() -> bool:
	if !build_valid:
		return false
		
	var turret_cost = get_turret_cost(building_scene)
	if GlobalVars.money < turret_cost:
		return false

	var new_tower: Node2D = building_scene.instantiate()
	new_tower.position = build_location
	var turret_container: Node2D = level.get_node("Turrets")
	turret_container.add_child(new_tower, true)

	var current_tile = get_tile_coord_scaled(build_location, buildable_spots_tilemap)
	buildable_spots_tilemap.set_cell(current_tile, -1)  # Erase the tile
	
	GlobalVars.money -= turret_cost

	return true


func get_tile_coord_scaled(position: Vector2, tilemap: TileMapLayer) -> Vector2i:
	# Scale down coordinates to the original size of the tilemap
	var scaled_position = Vector2(
		position.x / tilemap.scale.x,
		position.y / tilemap.scale.y
	)
	return tilemap.local_to_map(scaled_position)


func get_turret_cost(scene: PackedScene) -> int:
	if scene == gum_turret_scene:
		return GlobalVars.gum_turret_price
	elif scene == vape_turret_scene:
		return GlobalVars.vape_turret_price
	else:
		# default cost
		return 100
