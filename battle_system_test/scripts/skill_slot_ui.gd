extends ColorRect
class_name SkillSlot

@export var label: String = ""

func _ready():
	$Label.text = label

func _get_drag_data(_at_position: Vector2):
	print("start")
	set_drag_preview(make_preview())
	return self

func make_preview():
	var preview: ColorRect = ColorRect.new()
	preview.size = size
	preview.color = color
	preview.color.a = 0.5
	return preview
