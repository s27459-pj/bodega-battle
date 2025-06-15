extends Node2D

var dir:float
@export var speed= 50
@export var hitDelay = 1.0
@export var lifetime = 4

@onready var attack_delay: Timer = $attackDelay
@onready var lifetime_t: Timer = $lifetime
@onready var hitbox: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	attack_delay.wait_time = hitDelay
	lifetime_t.wait_time = lifetime 
	lifetime_t.start()
	

func _physics_process(delta: float) -> void:
	position += Vector2(speed * delta,0).rotated(dir) 


func _on_lifetime_timeout() -> void:
	animation_player.play("die")

func die() -> void:
	queue_free()

func _on_attack_delay_timeout() -> void:
	var overlapingBodies = hitbox.get_overlapping_bodies()
	for e in overlapingBodies:
		if e.is_in_group("enemies"):
			if e.has_method("take_damage"):
				e.take_damage(10)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		queue_free()
		
