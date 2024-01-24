extends Actor

func change_moves() -> void:
	# pretend there's like a whole AI here
	print("shuffling... ")
	# sim animation time
	await get_tree().create_timer(1).timeout
	turn_queue.shuffle()

func _on_player_actor_do_damage(damage: int) -> void:
	cur_health -= damage
	if cur_health <= 0:
		cur_health = 0

func _on_atb_timer_timeout():
	changing_time = true
