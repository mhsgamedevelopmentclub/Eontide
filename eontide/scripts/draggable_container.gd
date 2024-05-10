class_name DraggableContainer
extends VBoxContainer

signal slot_changed(draggable)

func _ready() -> void:
	for container in get_tree().get_nodes_in_group('drag_container'):
		container.connect('slot_changed', _on_data_dropped)

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Node and data.is_in_group('draggable')

func _drop_data(_at_position: Vector2, data: Variant):
	var draggable: Draggable = data as Draggable
	emit_signal('slot_changed', draggable)
	add_child(draggable.duplicate())

func _on_data_dropped(dropped_draggable: Draggable) -> void:
	if dropped_draggable in get_children():
		remove_child(dropped_draggable)
		dropped_draggable.queue_free()
