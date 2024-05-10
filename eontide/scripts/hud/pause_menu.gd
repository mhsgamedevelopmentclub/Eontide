class_name PauseMenu
extends CanvasLayer

@onready var back_to_game_button := $"MarginContainer/VBoxContainer/Back 2 Game"
@onready var main_menu_button := $"MarginContainer/VBoxContainer/Main Menu"

func _ready() -> void:
	back_to_game_button.connect('pressed', return_to_game)
	main_menu_button.connect('pressed', return_to_main_menu)

func return_to_game() -> void:
	visible = false
	get_tree().paused = false

func return_to_main_menu() -> void:
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')
