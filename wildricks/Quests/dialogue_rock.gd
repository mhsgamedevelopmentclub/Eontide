extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.evalie_quest_room == 1:
		if gameState.evalie_room_1_dialogue_rock == false:
			visible = true
		else:
			visible = false
	if gameState.evalie_quest_room == 4:
		if gameState.evalie_room_4_dialogue_rock == false:
			visible = true
		else:
			visible = false
	if gameState.evalie_quest_room == 6:
		if gameState.evalie_room_6_dialogue_rock == false:
			visible = true
		else:
			visible = false
