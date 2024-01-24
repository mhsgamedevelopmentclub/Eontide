extends Node

@onready var turn_queue := $TurnQueue
@onready var hud := $HUD

func _ready() -> void:
	var actors := turn_queue.get_children()
	hud.init(actors)
	turn_queue.init()
