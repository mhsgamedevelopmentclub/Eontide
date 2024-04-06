extends CharacterBody2D

@onready var gameState = $"/root/GameState"

func _process(delta):
	if gameState.evalie_go_home == true:
		hide()
