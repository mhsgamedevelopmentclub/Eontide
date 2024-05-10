class_name Enemy
extends Entity

signal trigger_battle

@export var interaction_range: Area2D

var enraged: bool = false

var target_body: Node2D

func _ready() -> void:
	if get_parent() is GameManager:
		connect(&'trigger_battle', (get_parent() as GameManager).start_battle)
	interaction_range.connect(&'body_entered', _body_entered)
	interaction_range.connect(&'body_exited', _body_exited)

func _process(_delta: float) -> void:
	if enraged:
		direction = position.direction_to(target_body.position)
	else:
		direction = Vector2.ZERO
	animated_sprite.flip_h = velocity.x < 0

func _physics_process(_delta: float) -> void:
	move()
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision and collision.get_collider() is Player:
		emit_signal(&'trigger_battle')
		queue_free()

func _body_entered(body: Node2D) -> void:
	if body is Player:
		target_body = body
		enraged = true

func _body_exited(body: Node2D) -> void:
	if body is Player:
		target_body = null
		enraged = false
