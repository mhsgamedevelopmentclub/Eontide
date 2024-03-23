extends Node2D

@onready var gameState = $"/root/GameState"

var square_scene: String = "res://scenes/square_scene.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameState.go_to_square == true:
		get_tree().change_scene_to_file(square_scene)

		
