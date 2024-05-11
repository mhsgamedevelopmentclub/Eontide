extends Area2D

@export var dialogueResource: DialogueResource
@export var dialogueStart: String = "Rock"
# Called when the node enters the scene tree for the first time.

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogueResource, dialogueStart)
