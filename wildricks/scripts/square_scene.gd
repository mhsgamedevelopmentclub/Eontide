extends Node2D

@onready var gameState = $"/root/GameState"

var town_scene: String = "res://scenes/town_scene.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameState.go_to_town == true:
		get_tree().change_scene_to_file(town_scene)
		gameState.go_to_town = false
