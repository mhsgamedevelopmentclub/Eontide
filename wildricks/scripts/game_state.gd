extends Node

var completed_Aurum_1_1: bool = false
var completed_Evalie_1_1: bool = false

var go_to_square: bool = false

var at_square: bool = false
var listen_to_peasprout: bool = false

var go_to_town: bool = false

var evalie_go_home: bool = false

#Main

var in_main: bool = true

var evalie_dialogue: bool = false

#Quests

var final_inscription_start: bool = false
var final_inscription_end: bool = false
var final_rock: bool = false

#Quest 1

var evalie_quest_start: bool = false
var evalie_quest_complete: bool = false

var main_character_name: String = "MC"

var evalie_quest_room: int = 0

var evalie_room_1_dialogue_evalie: bool = false

var evalie_room_1_dialogue_rock: bool = false

var evalie_room_2_dialogue_evalie: bool = false

var evalie_room_2_fight_complete: bool = false

var evalie_room_4_dahlia_1: bool = false

var evalie_room_4_dahlia_2: bool = false

var evalie_room_4_dialogue_dahlia: bool = false

var evalie_room_4_dialogue_rock: bool = false

var evalie_room_5_get_skill: bool = false

var evalie_room_5_dialogue_treasure_chest: bool = false

var evalie_room_6_dialogue_rock: bool = false

var evalie_room_7_dialogue_evalie: bool = false

var evalie_room_7_return: bool = false

#Quest 2

var julian_quest_start: bool = false
var julian_quest_complete: bool = false

var julian_quest_room: int = 0

var julian_room_1_dialogue_julian: bool = false

var julian_room_3_dialogue_julian: bool = false

var julian_room_4_dialogue_julian: bool = false

var julian_room_5_dialogue_julian: bool = false

var julian_room_5_return: bool = false

func _process(delta):
	if evalie_quest_complete == true and evalie_room_7_return == true:
		get_tree().change_scene_to_file("res://Quests/main.tscn")
		evalie_room_7_return = false
		in_main = true
		evalie_quest_room = 0
	if julian_quest_complete == true and julian_room_5_return == true:
		get_tree().change_scene_to_file("res://Quests/main.tscn")
		julian_room_5_return = false
		julian_quest_room = 0
		in_main = true
