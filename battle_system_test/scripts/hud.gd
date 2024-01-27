extends CanvasLayer

@onready var inventory := $HBoxContainer/VBoxContainer/Inventory
@onready var turn_wheel := $"HBoxContainer/VBoxContainer/Turn Wheel"
@onready var atb_container := $"HBoxContainer/VBoxContainer2/ATB Container"

@onready var atb_bar := preload('res://battle_system_test/scenes/atb_bar.tscn')
@onready var skill_ui := preload('res://battle_system_test/scenes/skill_slot_ui.tscn')

func init(actors: Array[Node]) -> void:
	for actor in actors:
		var new_bar := atb_bar.instantiate()
		new_bar.init(actor)
		atb_container.add(new_bar)
		if actor.name == 'PlayerActor':
			# should get skill resources from player as strings
			var p_skills := ["attack", "defend", "heal"]
			for skill in p_skills:
				var new_skill := skill_ui.instantiate()
				new_skill.init(skill)
				inventory.add(new_skill)
			actor.connect('open_change_turn', Callable(turn_wheel, 'on_open_change_turn'))
			turn_wheel.connect('update_turn_ord', Callable(actor, 'reorder_turn'))
