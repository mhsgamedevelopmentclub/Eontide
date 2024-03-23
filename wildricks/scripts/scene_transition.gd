extends CanvasLayer

@onready var anim_player := $AnimationPlayer

func transition():
	anim_player.play("fade_transition")
