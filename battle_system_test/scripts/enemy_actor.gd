extends Actor

func change_moves() -> void:
	# pretend there's like a whole AI here
	print("changing... ")
	# sim animation time
	await get_tree().create_timer(1).timeout
	turn_cycle.shuffle()

func _on_player_actor_do_damage(damage: int) -> void:
	if defending:
		cur_health -= damage / def_strength
	else:
		cur_health -= damage
	if cur_health <= 0:
		emit_signal("death")
	emit_signal('update_health_ui', cur_health)
	sprite.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.25).timeout
	sprite.modulate = Color(1, 1, 1)
