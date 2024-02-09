class_name MainMenu
extends Control

@onready var new_game_button := $"HBoxContainer/VBoxContainer/New Game"
@onready var load_game_button := $"HBoxContainer/VBoxContainer/Load Game"
@onready var settings_button := $HBoxContainer/VBoxContainer/Settings
@onready var credits_button := $HBoxContainer/VBoxContainer/Credits

func _ready() -> void:
	connect(new_game_button.pressed, new_game)
	connect(load_game_button.pressed, load_game)
	connect(settings_button.pressed, open_settings)
	connect(credits_button.pressed, open_settings)

func new_game() -> void:
	pass

func load_game() -> void:
	pass

func open_settings() -> void:
	pass

func open_credits() -> void:
	pass
