extends Control

@onready var userInput: TextEdit = $"VBoxContainer/TextEdit"
@onready var gameState = $"/root/GameState"
@onready var start_game: Button = $"VBoxContainer/Button"
@onready var see_ending: Button = $"VBoxContainer/Ending"

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game.connect("pressed", _on_button_pressed)
	see_ending.connect("pressed", _open_ending_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_edit_text_changed():
	gameState.main_character_name = userInput.text


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Quests/main.tscn")

func _open_ending_scene():
	get_tree().change_scene_to_file("res://Quests/ending_scene.tscn")
	gameState.final_rock = true
