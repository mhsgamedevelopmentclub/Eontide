class_name Battle
extends Node

@onready var player_actor: PackedScene = preload('res://scenes/battle_sys/player_actor.tscn')
@onready var enemy_actor: PackedScene = preload('res://scenes/battle_sys/enemy_actor.tscn')

@onready var turn_queue: TurnQueue = $'Turn Queue' as TurnQueue
@onready var hud: BattleHUD = $HUD as BattleHUD

var overworld: GameManager

func init(player_health: int, player_skills: Array[Skill]) -> void:
	var heros: Array[PlayerActor] = [_gen_hero(player_health, player_skills)]
	var enemies: Array[EnemyActor] = _gen_enemies()
	hud.init(heros, enemies)
	for hero in heros:
		hero.connect(&'death', _remove_actor)
	for enemy in enemies:
		enemy.connect(&'death', _remove_actor)
	turn_queue.connect(&'battle_complete', _finish)
	turn_queue.init()

func _finish() -> void:
	get_tree().root.add_child(overworld)
	overworld.battle_cleanup(turn_queue.heros.get_children()[0] as PlayerActor)
	queue_free()

func _gen_hero(health: int, skills: Array[Skill]) -> PlayerActor:
	var new_player_actor: PlayerActor = player_actor.instantiate() as PlayerActor
	new_player_actor.cur_health = health
	new_player_actor.inventory = skills
	turn_queue.heros.add_child(new_player_actor)
	return new_player_actor

func _gen_enemies() -> Array[EnemyActor]:
	var enemies: Array[EnemyActor] = []
	for i in range(1):
		var new_enemy_actor: EnemyActor = enemy_actor.instantiate() as EnemyActor
		new_enemy_actor.set_name('Enemy '+str(i))
		new_enemy_actor.sprite = load('res://assets/enewmy1.png') as CompressedTexture2D
		new_enemy_actor.max_health = 25 #randi_range(1, 4) * 25
		new_enemy_actor.inventory = [
			load('res://resources/skills/attack.tres') as Skill,
			load('res://resources/skills/defend.tres') as Skill,
			load('res://resources/skills/heal.tres') as Skill
 		]
		turn_queue.enemies.add_child(new_enemy_actor)
		enemies.append(new_enemy_actor)
	return enemies

func _remove_actor(actor: Actor) -> void:
	actor.ui_visual.queue_free()
	actor.atb_bar.queue_free()
	actor.queue_free()
