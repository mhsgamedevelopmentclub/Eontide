extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.evalie_quest_room == 5:
		if gameState.evalie_room_5_dialogue_treasure_chest == false:
			visible = true
		else:
			visible = false
