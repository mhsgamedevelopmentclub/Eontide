class_name MainMenu
extends Control

@onready var new_game_button := $"HBoxContainer/VBoxContainer/New Game"
@onready var load_game_button := $"HBoxContainer/VBoxContainer/Load Game"
@onready var settings_button := $HBoxContainer/VBoxContainer/Settings
@onready var credits_button := $HBoxContainer/VBoxContainer/Credits

func _ready() -> void:
	new_game_button.connect('pressed', new_game)
	load_game_button.connect('pressed', load_game)
	settings_button.connect('pressed', open_settings)
	credits_button.connect('pressed', open_settings)

func new_game() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func load_game() -> void:
	pass

func open_settings() -> void:
	pass

func open_credits() -> void:
	pass
