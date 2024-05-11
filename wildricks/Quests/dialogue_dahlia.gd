extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.evalie_quest_room == 4:
		if gameState.evalie_room_4_dialogue_dahlia == false:
			visible = true
		else:
			visible = false
