extends Node2D

var targetPosition : Vector2

func _physics_process(delta: float) -> void:
	track()

#testing only not final
func track() -> void:
	targetPosition = get_global_mouse_position()
	#print(targetPosition)
	$Sprite2D.look_at(targetPosition)
