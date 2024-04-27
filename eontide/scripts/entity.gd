class_name Entity
extends CharacterBody2D

@export var anim_sprite: AnimatedSprite2D

@export var movement_speed: float = 256.0

var direction: Vector2

func _physics_process(_delta: float) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_slide()
