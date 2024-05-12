extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.julian_quest_room == 1:
		if gameState.julian_room_1_dialogue_julian == false:
			visible = true
		else:
			visible = false
	if gameState.julian_quest_room == 3:
		if gameState.julian_room_3_dialogue_julian == false:
			visible = true
		else:
			visible = false
	if gameState.julian_quest_room == 4:
		if gameState.julian_room_4_dialogue_julian == false:
			visible = true
		else:
			visible = false
	if gameState.julian_quest_room == 5:
		if gameState.julian_room_5_dialogue_julian == false:
			visible = true
		else:
			visible = false
