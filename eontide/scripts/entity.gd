class_name Entity
extends CharacterBody2D

@export var animated_sprite: AnimatedSprite2D

@export var movement_speed: float = 256.0

var direction: Vector2

func move() -> void:
	velocity = direction.normalized() * movement_speed
	move_and_slide()
