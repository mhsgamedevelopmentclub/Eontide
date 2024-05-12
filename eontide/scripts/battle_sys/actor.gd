class_name Actor
extends Node2D
## Class for representing "Actors" in a battle scene
##
## This class is responsible for handling the actors turn
## during a turn queue, as well as all of the actors stats
## during battle and necessary signals to communicate with
## the turn queue and HUD

signal do_damage(damage: int)
signal update_health_ui(value: int)
signal start_change_turn
signal finish_change_turn
signal death(actor: Actor)

@export var sprite: CompressedTexture2D
@export var max_health: int
@export var inventory: Array[Skill]

var atb_bar: ATBBar
var ui_visual: CenterContainer

var turn_cycle: Array[Skill]
var cur_health: int
var cur_idx: int = 0
var barrier: int = 0
var changing_time: bool = false

## Plays out the actor's full turn in the battle system
func play_turn() -> void:
	if changing_time or turn_cycle.size() == 0:
		print("shuffling...")
		# TODO: make code better so we don't need this
		@warning_ignore("redundant_await")
		await _change_moves()
		changing_time = false
		cur_idx = 0
	print("current health: ", cur_health)
	print("current action: ", turn_cycle[cur_idx].name)
	barrier = 0
	await _use_skill(turn_cycle[cur_idx])
	cur_idx = (cur_idx + 1) % turn_cycle.size()
	print(name+" turn complete")

func _ready() -> void:
	cur_health = max_health

## Executes necessary attack, defend, and heal functions
## based on the values of the passed in skill
func _use_skill(skill: Skill) -> void:
	print(name+' used '+skill.name)
	if skill.damage > 0:
		_attack(skill.damage)
	if skill.shield > 0:
		_defend(skill.shield)
	if skill.heal > 0:
		_heal(skill.heal)
	# Simulate attack animation
	await get_tree().create_timer(3).timeout

## Deals damage to opposing actor
func _attack(damage: int) -> void:
	emit_signal('do_damage', damage)
	print('dealt '+str(damage)+' damage')

## Sets the actor's shield value to the value passed in
func _defend(shield: int) -> void:
	barrier = shield
	print('erected a shield of '+str(shield)+' strength')

## Restores actor's health by the value passed in
## (can't go over max health). also updates the
## connected health UI
func _heal(health: int) -> void:
	cur_health += health
	if cur_health > max_health:
		cur_health = max_health
	emit_signal('update_health_ui', cur_health)
	print('healed '+str(health)+' damage')

## Subtracts damage recieved from an opposing actor
## from the actor's current health
func _on_damage_recived(damage: int) -> void:
	if barrier > 0:
		damage -= barrier
	if damage > 0:
		cur_health -= damage
	if cur_health <= 0:
		# frees the actor not the ui sprite dumbass
		emit_signal(&'death', self)
	emit_signal('update_health_ui', cur_health)

## Sets changing_time to true when signal is recieved
func _on_atb_timer_timeout() -> void:
	changing_time = true

## Implemented solely by child classes
func _change_moves() -> void:
	pass
