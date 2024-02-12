class_name BattleBackground
extends ColorRect

@onready var player_container := $"HBoxContainer/Player Container"
@onready var enemy_container := $"HBoxContainer/Enemy Container"

func init(actors: Array[Node]) -> void:
	for actor in actors:
		var sprite := _construct_sprite(actor)
		if actor.name == 'PlayerActor':
			player_container.add_child(sprite)
		else:
			enemy_container.add_child(sprite)

func _construct_sprite(actor: Node) -> CenterContainer:
	var container := CenterContainer.new()
	container.size_flags_horizontal = SIZE_SHRINK_CENTER
	container.size_flags_vertical = SIZE_SHRINK_CENTER
	container.add_child(actor.sprite)
	return container as CenterContainer
