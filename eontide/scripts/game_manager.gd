class_name GameManager
extends Node2D

@onready var battle_scene: PackedScene = preload('res://scenes/battle_sys/battle_scene.tscn')

@export var hud: HUD

var inventory: Inventory
var status_bar: StatusBar

func _ready() -> void:
	if hud:
		inventory = hud.inventory_menu
		status_bar = hud.status_bar

func start_battle() -> void:
	var new_battle: Battle = (battle_scene.instantiate() as Battle)
	new_battle.overworld = self
	get_tree().root.add_child(new_battle)
	get_tree().root.remove_child(self)
	new_battle.init(status_bar.healthbar.value, inventory.skills)

func battle_cleanup(player: PlayerActor) -> void:
	status_bar.healthbar.value = player.cur_health
