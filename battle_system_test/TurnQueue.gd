extends Node

var active_actor: Actor

func _ready() -> void:
	active_actor = get_child(0)

func _process(_delta) -> void:
	await active_actor.play_turn()
	var active_idx := (active_actor.get_index() + 1) % get_child_count()
	active_actor = get_child(active_idx)
