class_name SceneTransition
extends CanvasLayer

@onready var anim_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var tree: SceneTree = get_tree() as SceneTree

func _ready() -> void:
	anim_player.play_backwards(&'fade')

func change_scene(path: String) -> void:
	anim_player.play(&'fade')
	await anim_player.animation_finished
	tree.change_scene_to_file(path)
	anim_player.play_backwards(&'fade')

func start_battle(overworld: GameManager, new_battle: Battle) -> void:
	anim_player.play(&'fade')
	await anim_player.animation_finished
	new_battle.overworld = overworld
	tree.root.add_child(new_battle)
	tree.root.remove_child(overworld)
	new_battle.init(overworld.status_bar.healthbar.value, overworld.inventory.skills)
	anim_player.play_backwards(&'fade')

func finish_battle(battle: Battle) -> void:
	anim_player.play(&'fade')
	await anim_player.animation_finished
	tree.root.add_child(battle.overworld)
	battle.overworld.battle_cleanup(battle.turn_queue.heros.get_children()[0] as PlayerActor)
	anim_player.play_backwards(&'fade')
	battle.queue_free()
