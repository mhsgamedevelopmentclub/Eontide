class_name TreasureChest
extends StaticBody2D

@export var item: Skill
@export var game_manager: GameManager
@export var anim_sprite: AnimatedSprite2D
@export var interaction_range: Area2D

var can_open: bool

func _ready() -> void:
	interaction_range.connect(&'body_entered', _body_entered)
	interaction_range.connect(&'body_exited', _body_exited)

func _process(_delta: float) -> void:
	if can_open and Input.is_action_just_pressed('interact'):
		game_manager.inventory.add_item(item)
		anim_sprite.set_animation(&'open')
		item = null

func _body_entered(body: Node2D) -> void:
	if body is Player and item:
		can_open = true

func _body_exited(body: Node2D) -> void:
	if body is Player:
		can_open = false
