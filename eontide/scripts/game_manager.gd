class_name GameManager
extends Node2D

@onready var battle_scene: PackedScene = preload('res://scenes/battle_sys/battle.tscn')

@export var hud: CanvasLayer

var inventory: Inventory
var health_bar: HealthBar

func _ready() -> void:
	if hud:
		pass

func start_battle() -> void:
	var new_battle: Battle = (battle_scene.instantiate() as Battle)
	new_battle.overworld = self
	get_tree().root.add_child(new_battle)
	get_tree().root.remove_child(self)
	new_battle.init(health_bar.healthbar.value, inventory.skills)
