extends Area2D

@export var dialogueResource: DialogueResource
@export var dialogueStart: String = "square_scenario"

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogueResource, dialogueStart)
