extends Node

var active_actor: Actor
var turn_count: int = 0

func init() -> void:
	active_actor = get_child(0)
	play_turn()

func play_turn() -> void:
	# This REALLY should not be using recursion
	# but i'm lazy 
	turn_count += 1
	print("Turn ", turn_count, ":")
	print("current actor: ", active_actor)
	await active_actor.play_turn()
	var active_idx := (active_actor.get_index() + 1) % get_child_count()
	active_actor = get_child(active_idx)
	play_turn()
