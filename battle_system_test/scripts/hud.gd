extends CanvasLayer

@onready var inventory := $HBoxContainer/VBoxContainer/Inventory
@onready var turn_wheel := $"HBoxContainer/VBoxContainer/Turn Wheel"
@onready var atb_container := $"HBoxContainer/VBoxContainer2/ATB Container"
@onready var battle_background := $"HBoxContainer/VBoxContainer2/Battle Background"

func init(actors: Array[Node]) -> void:
	battle_background.init(actors)
	atb_container.init(actors)
	
	# TODO: make this filter less crappy
	var player_actor := (
		actors.filter(func(x): return x.name == 'PlayerActor')
		as Array[Actor])[0]
	inventory.init(player_actor) 
	turn_wheel.init(player_actor)
