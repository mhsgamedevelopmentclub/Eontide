class_name Player
extends Entity

func _process(_delta: float) -> void:
	direction = Input.get_vector(
		'move_left', 'move_right', 'move_up','move_down')
	_set_move_animation()

func _physics_process(_delta: float) -> void:
	move()

func _set_move_animation() -> void:
	# TODO: make this if-else tree simpler
	if velocity.length() != 0:
		animated_sprite.play()
	else:
		animated_sprite.stop()
	if velocity.y > 0:
		animated_sprite.animation = &'move_down'
	elif velocity.y < 0:
		animated_sprite.animation = &'move_up'
	elif velocity.x != 0:
		animated_sprite.animation = &'move_side'
		animated_sprite.flip_h = velocity.x < 0
