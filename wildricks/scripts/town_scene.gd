extends Node2D

@onready var gameState = $"/root/GameState"

var scene_animation_complete: bool = false

func _ready():
    $Scene_Transition.anim_player.connect('animation_finished', change_scene)

func _process(_delta):
    if gameState.go_to_square == true:
        $Scene_Transition.transition()

func change_scene(_anim_name) -> void:
    get_tree().change_scene_to_file("res://scenes/square_scene.tscn")
