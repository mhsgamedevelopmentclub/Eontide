class_name Draggable
extends ColorRect

func _get_drag_data(_at_position: Vector2) -> Draggable:
	set_drag_preview(make_preview())
	return self

func make_preview() -> ColorRect:
	var preview: ColorRect = ColorRect.new()
	preview.size = size
	preview.color = color
	preview.color.a = 0.5
	return preview
