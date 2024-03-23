extends Node2D

@onready var gameState = $"/root/GameState"

<<<<<<< HEAD
var square_scene: String = "res://scenes/square_scene.tscn"
# Called when the node enters the scene tree for the first time.
=======
var scene_animation_complete: bool = false

>>>>>>> 735f46b5ebddd870ad8ccc11fee7017bd6b75946
func _ready():
	$Scene_Transition.anim_player.connect('animation_finished', change_scene)

func _process(_delta):
	if gameState.go_to_square == true:
<<<<<<< HEAD
		get_tree().change_scene_to_file(square_scene)

		
=======
		$Scene_Transition.transition()

func change_scene(_anim_name) -> void:
	get_tree().change_scene_to_file("res://scenes/square_scene.tscn")
>>>>>>> 735f46b5ebddd870ad8ccc11fee7017bd6b75946
