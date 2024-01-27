class_name Actor
extends Control

signal do_damage(damage: int)
signal open_change_turn
signal turn_complete

@export var max_health: int = 100
var cur_health := max_health

@export var atk_strength: int = 7
@export var def_strength: int = 5
@export var heal_strength: int = 2

var turn_queue: Array[String]
var cur_idx := 0

var defending: bool = false
var changing_time: bool = false

func play_turn() -> void:
	# will likely later pass resources as args
	# instead of pre-defined functions
	if changing_time or turn_queue.size() == 0:
		emit_signal('open_change_turn')
		changing_time = false
	print("current health: ", cur_health)
	print("current action: ", turn_queue[cur_idx])
	defending = false
	call(turn_queue[cur_idx])
	# needed to simulate fake animation time
	# ...and also because turn queue isn't reading 
	# emitted signal
	await get_tree().create_timer(3).timeout
	cur_idx = (cur_idx + 1) % turn_queue.size()
	print("Turn complete")
	# for some reason turn queue isn't detecting this
	emit_signal("turn_complete")

func reorder_turn(turn_list: Array[String]) -> void:
	pass

func _ready() -> void:
	# pretend that this is taken from the player's
	# inventory as an argument
	var turn_list: Array[String] = [
		"attack",
		"defend",
		"heal"
	]
	turn_queue += turn_list

###################################
# Actor actions
# (will convert to resources later) 
###################################
func attack() -> void:
	print("attacking...")
	emit_signal("do_damage", atk_strength)

func defend() -> void:
	print("defending...")
	defending = true

func heal() -> void:
	print("healing...")
	cur_health += heal_strength
	if cur_health > max_health:
		cur_health = max_health
