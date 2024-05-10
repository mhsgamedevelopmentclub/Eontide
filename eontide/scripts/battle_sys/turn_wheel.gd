class_name TurnWheel
extends Control

signal update_turn_ord(turn_list: Array[Skill])

@onready var button: Button = (
	$'Background/MarginContainer/VBoxContainer/Button' as Button)
@onready var container: DraggableContainer = ( 
	$'Background/MarginContainer/VBoxContainer/ColorRect/Draggable Container'
	as DraggableContainer)

func init(player: PlayerActor) -> void:
	player.connect('start_change_turn', _on_open_change_turn)
	connect('update_turn_ord', player.reorder_turn)
	player.turn_ord_updater = update_turn_ord 

func _ready() -> void:
	button.disabled = true

func _on_open_change_turn() -> void:
	button.disabled = false
	await button.pressed
	var turn_list: Array[Skill] = []
	for skill in (container.get_children() as Array[Draggable]): 
		turn_list.append(skill.item) 
	emit_signal("update_turn_ord", turn_list)
	button.disabled = true
