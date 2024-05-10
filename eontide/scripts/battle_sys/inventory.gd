class_name BattleInventory
extends Control

@onready var container: DraggableContainer = (
	$'Background/MarginContainer/VBoxContainer/ColorRect/Draggable Container'
	as DraggableContainer)
@onready var draggable_tscn: PackedScene #= preload('res://scenes/menus/draggable.tscn')

func init(player: PlayerActor) -> void:
	var inventory: Array[Skill] = player.inventory
	for skill in inventory:
		var new_draggable: Draggable = draggable_tscn.instantiate() as Draggable
		new_draggable.item = skill
		new_draggable.init()
		container.add_child(new_draggable)
