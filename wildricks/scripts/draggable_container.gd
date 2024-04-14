class_name DraggableContainer
extends VBoxContainer

signal slot_changed

var groups: Array[StringName]

func _ready() -> void:
	# TODO: figure out how to differentiate between
	# consumables and skills
	groups = get_groups()
	groups.sort()
	for container in get_tree().get_nodes_in_group(groups[0]):
		container.connect('slot_changed', _on_data_dropped)

func _on_data_dropped() -> void:
	pass
