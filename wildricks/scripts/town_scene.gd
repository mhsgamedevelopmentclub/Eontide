extends Node2D

@onready var gameState = $"/root/GameState"

var scene_animation_complete: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameState.go_to_square == true:
		$Scene_Transition.transition()
		await $Scene_Transition.transitioned
		get_tree().change_scene_to_file("res://scenes/square_scene.tscn")
