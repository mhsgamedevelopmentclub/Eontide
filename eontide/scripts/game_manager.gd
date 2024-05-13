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
	var new_battle: Battle = battle_scene.instantiate() as Battle
	Transition.start_battle(self, new_battle)

func battle_cleanup(player: PlayerActor) -> void:
	status_bar.healthbar.value = player.cur_health
