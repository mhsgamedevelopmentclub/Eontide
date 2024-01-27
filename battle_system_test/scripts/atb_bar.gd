class_name ATBBar
extends HBoxContainer 

func init(actor: Actor) -> void:
	$Label.text = actor.name
	$Timer.connect('timeout', Callable(actor, 'on_timer_timeout'))
