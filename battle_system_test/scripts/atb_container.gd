class_name ATBContainer
extends Control

@onready var atb_bar := preload('res://battle_system_test/scenes/atb_bar.tscn')

@onready var container := $VBoxContainer

func init(actors: Array[Node]) -> void:
	for actor in actors:
		var bar := _gen_bar(actor as Actor)
		container.add_child(bar)
		actor.connect('toggle_timers', _toggle_timers)

func _gen_bar(actor: Actor) -> ATBBar:
	var new_bar := atb_bar.instantiate()
	new_bar.init(actor)
	return new_bar

func _toggle_timers() -> void:
	# PLEASE never write code like this
	# this is lazy af
	var timers := get_tree().get_nodes_in_group("battle_timer")
	for timer in timers:
		timer.paused =  !timer.paused
