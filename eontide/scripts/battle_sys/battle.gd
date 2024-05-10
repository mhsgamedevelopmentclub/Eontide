class_name Battle
extends Node

@onready var player_actor: PackedScene = preload('res://scenes/battle_sys/player_actor.tscn')
@onready var enemy_actor: PackedScene = preload('res://scenes/battle_sys/enemy_actor.tscn')

@onready var turn_queue: TurnQueue = $'Turn Queue' as TurnQueue
@onready var hud: BattleHUD = $HUD as BattleHUD

var overworld: GameManager

func init(player_health: int, player_skills: Array[Skill]) -> void:
	var heros: Array[PlayerActor] = []
	var enemies: Array[EnemyActor] = []
	turn_queue.connect(&'battle_complete', _finish)
	hud.init(heros, enemies)
	turn_queue.init()

func _finish() -> void:
	get_tree().root.add_child(overworld)
	queue_free()
