extends Node2D

@onready var gameState = $"/root/GameState"

var square_scene: String = "res://scenes/square_scene.tscn"

func _process(_delta):
	if gameState.go_to_square == true:
		get_tree().change_scene_to_file(square_scene)
		gameState.go_to_square = false
