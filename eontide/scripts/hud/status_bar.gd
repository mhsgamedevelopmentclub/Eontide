class_name StatusBar
extends CanvasLayer

@onready var bar_red := load('res://assets/barHorizontal_red.png')
@onready var bar_green := load('res://assets/barHorizontal_green.png')
@onready var bar_yellow := load('res://assets/barHorizontal_yellow.png')

@onready var healthbar: TextureProgressBar = $'VBoxContainer/Health Bar' as TextureProgressBar
@onready var healthbar_label: Label = $'VBoxContainer/Health Bar/Label' as Label
@onready var fragmentbar: Label = $'VBoxContainer/Fragment Bar' as Label

@export var max_health: int = 100
@export var current_health: int = 100

func update_fragments(value: int) -> void:
	fragmentbar.text = 'Fragments: {}'.format([value], '{}')

func update_health(value: int) -> void:
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	healthbar.value = value
	_update_text(value)

func _update_text(value: int) -> void:
	healthbar_label.text = "{} / {}".format(
		[value, healthbar.max_value], 
		'{}'
	)
