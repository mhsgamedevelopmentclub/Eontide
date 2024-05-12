class_name BattleBackground
extends TextureRect

@onready var hero_container := $"HBoxContainer/Hero Container"
@onready var enemy_container := $"HBoxContainer/Enemy Container"
@onready var health_bar: PackedScene = preload('res://scenes/battle_sys/health_bar.tscn')

func init(heros: Array[PlayerActor], enemies: Array[EnemyActor]) -> void:
	for hero in heros:
		var visual: CenterContainer = _construct_visual(hero)
		hero.ui_visual = visual
		hero_container.add_child(visual)
	for enemy in enemies:
		var visual: CenterContainer = _construct_visual(enemy)
		enemy.ui_visual = visual
		enemy_container.add_child(visual)

func _construct_visual(actor: Actor) -> CenterContainer:
	var container: CenterContainer = _construct_visual_container()
	var health_ui: BattleHealthBar = _construct_health_bar(actor)
	var sprite: Sprite2D = _construct_sprite(actor.sprite)
	sprite.add_child(health_ui)
	container.add_child(sprite)
	return container

func _construct_visual_container() -> CenterContainer:
	var container: CenterContainer = CenterContainer.new()
	container.set_h_size_flags(SIZE_SHRINK_CENTER+SIZE_EXPAND)
	container.set_v_size_flags(SIZE_SHRINK_CENTER+SIZE_EXPAND)
	return container

func _construct_health_bar(actor: Actor) -> BattleHealthBar:
	var health_ui: BattleHealthBar = health_bar.instantiate() as BattleHealthBar
	health_ui.init(actor)
	health_ui.set_scale(Vector2(10, 10))
	return health_ui

func _construct_sprite(texture: CompressedTexture2D) -> Sprite2D:
	var sprite: Sprite2D = Sprite2D.new()
	sprite.texture = texture
	sprite.set_scale(Vector2(0.1, 0.1))
	return sprite
