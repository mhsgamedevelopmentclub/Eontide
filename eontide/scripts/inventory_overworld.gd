class_name Inventory
extends CanvasLayer

@onready var skill_container: VBoxContainer = $'MarginContainer/HBoxContainer/HBoxContainer/VBoxContainer/Panel/Skill Container'
@onready var item_container: VBoxContainer = $'MarginContainer/HBoxContainer/HBoxContainer/VBoxContainer2/Panel/Item Container'
@onready var item_description: Dictionary = {
	'name': $'MarginContainer/HBoxContainer/Panel/Description Container/Item Name',
	'sprite': $'MarginContainer/HBoxContainer/Panel/Description Container/Background/CenterContainer/Item Sprite',
	'text': $'MarginContainer/HBoxContainer/Panel/Description Container/MarginContainer/Item Description'
}

@export var consumables: Array[Consumable]
@export var skills: Array[Skill]

var selected_item: Item

func add_item(item: Item) -> void:
	if item is Skill:
		skills.append(item)
	else:
		consumables.append(item)

func toggle_ui() -> void:
	if visible:
		hide()
	else:
		_update_ui_description()
		show()

func _update_ui_description() -> void:
	if not selected_item:
		return
	item_description['name'].text = selected_item.name
	item_description['sprite'].texture = selected_item.icon
	item_description['text'].text = selected_item.description

func _update_ui_containers() -> void:
	pass

func _update_selected_item() -> void:
	pass

func _ready() -> void:
	hide()
