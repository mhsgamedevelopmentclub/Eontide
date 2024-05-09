extends Control

@onready var userInput: TextEdit = $"VBoxContainer/TextEdit"
@onready var gameState = $"/root/GameState"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_edit_text_changed():
	gameState.main_character_name = userInput.text
