class_name PlayerActor
extends Actor
## Class that extends the base actor class with specific 
## functionality to handle turn queue updates from the 
## inventory UI

var turn_ord_updater: Signal

## Send's signal to turn queue to update the actor's
## turn cycle
func _change_moves() -> void:
	emit_signal('start_change_turn')
	await turn_ord_updater
	emit_signal('finish_change_turn')

## Connects signals between the actor and the provided
## turn queue without having to store an explicit reference
## to it for later
func sync_queue(turn_queue: TurnWheel) -> void:
	connect('start_change_turn', turn_queue.on_open_change_turn)
	turn_queue.connect('update_turn_ord', reorder_turn)
	# store reference of turn queue's signal for change_moves()
	turn_ord_updater = turn_queue.update_turn_ord

## Updates the actor's turn cycle to the list of
## skills recieved
func reorder_turn(turn_list: Array[Skill]) -> void:
	turn_cycle = turn_list

