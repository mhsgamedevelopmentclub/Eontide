extends Node

@onready var turn_queue := $TurnQueue
@onready var hud := $HUD

func _ready() -> void:
	var actors := turn_queue.get_children() as Array[Node]
	for actor in actors:
		actor.connect('death', _finish)
	hud.init(actors)
	turn_queue.init()

func _finish() -> void:
	get_tree().quit()
