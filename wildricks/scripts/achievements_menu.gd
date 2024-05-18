extends Control

@onready var gameState = $"/root/GameState"

@onready var exit_button: Button = $"Exit"

@onready var quest1_texture: TextureRect = $"GridContainer/Quest1/TextureRect"
@onready var quest1_button: Button = $"GridContainer/Quest1/Button"
@onready var quest2_button: Button = $"GridContainer/Quest2/Button"
@onready var quest3_button: Button = $"GridContainer/Quest3/Button"

@onready var quest_details: CanvasLayer = $"GridContainer/QuestDetails"
@onready var quest_details_label: Label = $"GridContainer/QuestDetails/Label"
@onready var quest_details_1: String = "asdasdasdasfdsfasdsadfasfw"
@onready var quest_details_2: String = "adf;lasjdflkajsd;fjal;sdkfja;sldjf;asl"
@onready var quest_details_3: String = "asdf;jsado;fjewoailije;ailwfk"
@onready var quest_details_exit: Button = $"GridContainer/QuestDetails/Exit"

@onready var main_scene_path: String = "res://scenes/main_menu.tscn"

var quest1_texture_path: String = "res://assets/house1.png"

@onready var ending_scene: Button = $"Ending_scene"
# Called when the node enters the scene tree for the first time.
func _ready():
	quest_details.visible = false
	quest1_button.connect("pressed", _on_button_pressed.bind(quest1_button))
	quest2_button.connect("pressed", _on_button_pressed.bind(quest2_button))
	quest3_button.connect("pressed", _on_button_pressed.bind(quest3_button))
	quest_details_exit.connect("pressed", _exit_quest_details)
	exit_button.connect("pressed", _exit_achievements.bind(main_scene_path))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameState.evalie_quest_complete == true:
		if ResourceLoader.exists(quest1_texture_path):
			quest1_texture.texture = load(quest1_texture_path)
	else:
		quest1_texture.texture = null


func _on_button_pressed(button):
	quest_details.visible = true
	if button == quest1_button:
		quest_details_label.text = quest_details_1
	if button == quest2_button:
		quest_details_label.text = quest_details_2
	if button == quest3_button:
		quest_details_label.text = quest_details_3

func _exit_quest_details():
	quest_details.visible = false


func _exit_achievements(previous_scene):
	print("exit")
	if previous_scene == main_scene_path:
		get_tree().change_scene_to_file(main_scene_path)



