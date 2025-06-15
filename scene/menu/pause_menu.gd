extends Control

@export var scene_handler: Node

func pause():
	get_tree().paused = true
	$".".show()
	$AnimationPlayer.play("appear")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("appear")
	$".".hide()

func togglePause():
	if get_tree().paused:
		resume()
	else:
		pause()

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		togglePause()

func _on_resume_button_pressed() -> void:
	resume()

func _on_restart_button_pressed() -> void:
	resume()
	get_tree().call_group("scene-handler", "restart_game")

func _on_exit_button_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
