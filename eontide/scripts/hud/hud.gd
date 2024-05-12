class_name HUD
extends CanvasLayer

@onready var achievements_menu: Achievements = $Achievements as Achievements
@onready var inventory_menu: Inventory = $Inventory as Inventory
@onready var pause_menu: PauseMenu = $'Pause Menu' as PauseMenu
@onready var status_bar: StatusBar = $'Status Bar' as StatusBar

func _process(delta: float) -> void:
	if achievements_menu.visible or inventory_menu.visible or pause_menu.visible:
		return
	if Input.is_action_pressed('achievements'):
		achievements_menu.show()
	if Input.is_action_pressed('inventory'):
		inventory_menu.show()
	if Input.is_action_pressed('pause'):
		get_tree().paused = true
		pause_menu.show()
