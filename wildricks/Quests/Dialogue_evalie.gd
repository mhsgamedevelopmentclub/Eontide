extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.evalie_quest_room == 1:
		if gameState.evalie_room_1_dialogue_evalie == false:
			visible = true
		else:
			visible = false
	if gameState.evalie_quest_room == 2:
		if gameState.evalie_room_2_dialogue_evalie == false:
			visible = true
		else:
			visible = false
