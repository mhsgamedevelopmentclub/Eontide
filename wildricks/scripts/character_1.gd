extends CharacterBody2D

@export var moveSpeed: float = 10000

@onready var actionableFinder: Area2D = $Direction/ActionableFinder

func _physics_process(delta):
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = inputDirection.normalized() * moveSpeed * delta
	
	move_and_slide()

func _unhandled_input(_event) -> void:
	if Input.is_action_just_pressed("interactDialogue"):
		var actionables = actionableFinder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
