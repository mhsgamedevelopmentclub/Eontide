extends Control

@onready var container := $"Background/MarginContainer/VBoxContainer/ColorRect/Skill Slot Container"

func add(skill: SkillSlot) -> void:
	container.add_child(skill)
