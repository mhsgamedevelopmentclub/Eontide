extends CharacterBody2D

signal start_battle

var speed = 100
var player_chase = null
var player = null
var collision = false

func _ready() -> void:
	connect('start_battle', get_parent().start_battle)

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed

func _process(delta):
	if collision == true:
		emit_signal('start_battle')
		queue_free()

func _on_actionable_body_entered(body):
	player = body
	player_chase = true

func _on_actionable_body_exited(body):
	player = null
	player_chase = false

func _on_collision_detector_area_entered(area):
	collision = true

func _on_collision_detector_area_exited(area):
	collision = false
