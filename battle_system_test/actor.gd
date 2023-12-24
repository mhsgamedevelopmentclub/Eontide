class_name Actor
extends Node2D

@export var max_health: int = 100
var cur_health := max_health

@export var atk_strength: int = 7
@export var def_strength: int = 5
@export var heal_strength: int = 2

var turn_queue: Array[String]

func play_turn():
	pass

func _ready():
	var turn_list := [
		"attack",
		"defend",
		"heal"
	]
	turn_queue += turn_list

func _change_moves():
	pass
