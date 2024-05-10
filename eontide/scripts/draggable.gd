class_name Draggable
extends ColorRect

@export var item: Item

func init() -> void:
	name = item.name
	($HBoxContainer/Label as Label).text = item.name
	($HBoxContainer/Icon as TextureRect).texture = item.icon
	if item is Skill:
		color = (item as Skill).color

func _get_drag_data(_at_position: Vector2) -> Draggable:
	set_drag_preview(_make_preview())
	return self

func _make_preview() -> ColorRect:
	var preview: ColorRect = ColorRect.new()
	preview.size = size
	preview.color = color
	preview.color.a = 0.5
	return preview
