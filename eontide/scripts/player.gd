class_name Player
extends Entity

@onready var anim_sprite: AnimatedSprite2D = $Sprite2D as AnimatedSprite2D

func _process(_delta: float) -> void:
	direction = Input.get_vector(
		'move_left', 'move_right', 'move_up','move_down')
	_set_move_animation()

func _set_move_animation() -> void:
	# TODO: make this if-else tree simpler
	if velocity.length() != 0:
		anim_sprite.play()
	else:
		anim_sprite.stop()
	if velocity.y > 0:
		anim_sprite.animation = &"move_down"
	elif velocity.y < 0:
		anim_sprite.animation = &"move_up"
	elif velocity.x != 0:
		anim_sprite.animation = &"move_side"
		anim_sprite.flip_h = velocity.x < 0
