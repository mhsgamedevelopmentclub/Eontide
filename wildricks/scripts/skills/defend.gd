class_name Defend
extends Skill

@export var name: String = 'Defend'
@export_multiline var description: String = '''
	Basic defensive maneuver using just the actor's body, blocks a light amount of damage.
	'''
@export var skill_cost: int = 1

@export var def_strength: int = 5
