class_name GameManager
extends Node2D

@onready var pause_menu := $"Pause Menu"

func _process(_delta) -> void:
	if Input.is_action_just_pressed("pause_menu"):
		get_tree().paused = true
		pause_menu.visible = true
