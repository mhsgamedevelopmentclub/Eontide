extends Actor

func change_moves() -> void:
	# pretend there's like a whole AI here
	print("shuffling... ")
	# sim animation time
	await get_tree().create_timer(1).timeout
	turn_cycle.shuffle()

func _on_player_actor_do_damage(damage: int) -> void:
	sprite.modulate = Color(1, 0, 0)
	cur_health -= damage
	if cur_health <= 0:
		emit_signal("death")
	sprite.modulate = Color(1, 1, 1)
