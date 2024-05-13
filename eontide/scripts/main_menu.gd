class_name MainMenu
extends Control

@onready var new_game_button := $"HBoxContainer/VBoxContainer/New Game"
@onready var load_game_button := $"HBoxContainer/VBoxContainer/Load Game"
@onready var credits_button := $HBoxContainer/VBoxContainer/Credits

func _ready() -> void:
	new_game_button.connect('pressed', new_game)
	load_game_button.connect('pressed', load_game)
	credits_button.connect('pressed', open_credits)

func new_game() -> void:
	Transition.change_scene('res://scenes/game.tscn')

func load_game() -> void:
	pass

func open_credits() -> void:
	pass
