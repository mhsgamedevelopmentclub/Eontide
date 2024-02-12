class_name Actor
extends Node2D

signal do_damage(damage: int)
signal open_change_turn
signal toggle_timers
signal start_new_cycle
signal death

@onready var sprite := Sprite2D.new()

@export var max_health: int = 100
var cur_health := max_health

@export var atk_strength: int = 7
@export var def_strength: int = 5
@export var heal_strength: int = 2

var turn_cycle: Array[String]
var cur_idx := 0

var defending: bool = false
var changing_time: bool = false

func play_turn() -> void:
	# will likely later pass resources as args
	# instead of pre-defined functions
	if changing_time or turn_cycle.size() == 0:
		print("shuffling...")
		emit_signal('toggle_timers')
		@warning_ignore("redundant_await")
		await change_moves()
		emit_signal('toggle_timers')
		emit_signal('start_new_cycle')
		changing_time = false
		cur_idx = 0
	print("current health: ", cur_health)
	print("current action: ", turn_cycle[cur_idx])
	defending = false
	call(turn_cycle[cur_idx])
	# needed to simulate fake animation time
	await get_tree().create_timer(3).timeout
	sprite.modulate = Color(1, 1, 1)
	cur_idx = (cur_idx + 1) % turn_cycle.size()
	print("Turn complete")

func on_timer_timeout() -> void:
	changing_time = true

func change_moves() -> void:
	pass

func _ready() -> void:
	# REALLY bad solution but idc
	sprite.texture = load("res://assets/OGPC MC Front Facing Pixel.png")
	# pretend that this is taken from the player's
	# inventory as an argument
	if not name == "PlayerActor":
		var turn_list: Array[String] = [
			"attack",
			"defend",
			"heal"
		]
		turn_cycle += turn_list

###################################
# Actor actions
# (will convert to resources later) 
###################################
func attack() -> void:
	print("attacking...")
	sprite.modulate = Color(1, 0, 0)
	emit_signal("do_damage", atk_strength)

func defend() -> void:
	print("defending...")
	sprite.modulate = Color(0, 0, 1)
	defending = true

func heal() -> void:
	print("healing...")
	sprite.modulate = Color(0, 1, 0)
	cur_health += heal_strength
	if cur_health > max_health:
		cur_health = max_health
