class_name Entity
extends CharacterBody2D

@export var tilemap: TileMap
@export var movement_speed: float = 500.0
var direction: Vector2

func _physics_process(_delta: float) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_slide()
