extends PathFollow2D

@export var speed = 200


func _physics_process(delta: float) -> void:
	move(delta)
	
func move(delta: float) -> void:
	progress += speed* delta
