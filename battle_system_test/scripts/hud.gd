extends CanvasLayer

@onready var inventory := $HBoxContainer/VBoxContainer/Inventory
@onready var turn_wheel := $"HBoxContainer/VBoxContainer/Turn Wheel"
@onready var atb_container := $"HBoxContainer/VBoxContainer2/ATB Container"
@onready var battle_background := $"HBoxContainer/VBoxContainer2/Battle Background"

@onready var atb_bar := preload('res://battle_system_test/scenes/atb_bar.tscn')
@onready var skill_ui := preload('res://battle_system_test/scenes/skill_slot_ui.tscn')

func init(actors: Array[Node]) -> void:
	battle_background.init(actors)
	for actor in actors:
		var new_bar := atb_bar.instantiate()
		new_bar.init(actor)
		atb_container.add(new_bar)
		if actor.name == 'PlayerActor':
			actor.connect('open_change_turn', _toggle_timers)
			turn_wheel.connect('unpause_timers', _toggle_timers)
			# should get skill resources from player as strings
			var p_skills := ["attack", "defend", "heal"]
			for skill in p_skills:
				var new_skill := skill_ui.instantiate()
				new_skill.init(skill)
				inventory.add(new_skill)
			actor.sync_queue(turn_wheel)

func _toggle_timers() -> void:
	# PLEASE never write code like this
	# this is lazy af
	var timers := get_tree().get_nodes_in_group("battle_timer")
	for timer in timers:
		timer = timer as Timer
		timer.paused =  !timer.paused
