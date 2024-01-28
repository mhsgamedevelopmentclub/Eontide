extends VBoxContainer

signal slot_changed(skill_slot_ui)
@onready var skill_slot_ui: PackedScene = preload('res://battle_system_test/scenes/skill_slot_ui.tscn')

func _ready():
	var containers := get_tree().get_nodes_in_group("drag_container")
	for container in containers:
		container.connect('slot_changed', Callable(self, 'on_data_dropped'))

func _can_drop_data(_at_position: Vector2, data) -> bool:
	return data is Node and data.is_in_group('draggable')

func _drop_data(_at_position: Vector2, data):
	var ui_copy: SkillSlot = skill_slot_ui.instantiate()
	ui_copy.init(data.name)
	add_child(ui_copy)
	emit_signal('slot_changed', data)

func on_data_dropped(dropped_item):
	if dropped_item in get_children():
		remove_child(dropped_item)
		dropped_item.queue_free()
