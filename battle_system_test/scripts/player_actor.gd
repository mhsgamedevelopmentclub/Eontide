extends Actor

@onready var sprite := load("res://assets/OGPC MC Front Facing Pixel.png")

var turn_ord_updater: Signal

func change_moves() -> void:
	emit_signal('open_change_turn')
	await turn_ord_updater

func sync_queue(turn_queue: TurnWheel) -> void:
	connect('open_change_turn', turn_queue.on_open_change_turn)
	turn_queue.connect('update_turn_ord', reorder_turn)
	turn_ord_updater = turn_queue.update_turn_ord

func reorder_turn(turn_list: Array[String]) -> void:
	turn_cycle = turn_list

func _on_enemy_actor_do_damage(damage: int) -> void:
	cur_health -= damage
	if cur_health <= 0:
		emit_signal("death")
