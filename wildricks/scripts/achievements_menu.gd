extends Control

@onready var gameState = $"/root/GameState"
@onready var quest1_texture: TextureRect = $"GridContainer/Quest1/TextureRect"
@onready var quest1_button: Button = $"GridContainer/Quest1/Button"
@onready var quest_details: CanvasLayer = $"GridContainer/QuestDetails"
@onready var quest_details_1: String = ""

var quest1_texture_path: String = "res://assets/house1.png"
# Called when the node enters the scene tree for the first time.
func _ready():
	quest_details.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interactDialogue"):
		gameState.quest1_complete = true
	if gameState.quest1_complete == true:
		if ResourceLoader.exists(quest1_texture_path):
			quest1_texture.texture = load(quest1_texture_path)
	else:
		quest1_texture.texture = null
	_on_button_pressed(quest1_button)


func _on_button_pressed(button):
	quest_details.visible = true
	if button == $"GridContainer/Quest1/Button":
		quest_details.label.text = quest_details_1
