extends CanvasLayer

signal transitioned
# Called when the node enters the scene tree for the first time.

func transition():
	$AnimationPlayer.play("fade_transition")
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_transition":
		emit_signal("transitioned")
