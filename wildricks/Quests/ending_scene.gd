extends Node2D

@onready var gameState = $"/root/GameState"
@onready var final_inscription: CharacterBody2D = $"Final_inscription"
@onready var black_screen: ColorRect = $"ColorRect"
@onready var main_character: CharacterBody2D = $"Character_1"
@onready var rock: CharacterBody2D = $"Rock"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameState.final_inscription_end == false:
		if gameState.final_inscription_start == false:
			main_character.visible = true
			final_inscription.visible = true
			black_screen.visible = false
			rock.visible = false
		else:
			final_inscription.visible = false
			main_character.visible = false
			black_screen.visible = true
			rock.visible = false
	else:
		main_character.visible = true
		black_screen.visible = true
		rock.visible = true
		final_inscription.visible = false
