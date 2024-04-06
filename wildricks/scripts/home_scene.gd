extends Node2D

signal world_changed(world_name)
var entered: bool = false

@export var world_name: String = "world"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_key_pressed(KEY_M):
			get_tree().change_scene_to_file("res://scenes/town_scene.tscn")
