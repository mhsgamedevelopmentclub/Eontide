class_name ATBBar
extends HBoxContainer
## Manages the UI of the Active-Time Battle system time gauge,
## emitting various signals during it's lifetime

var progress_bar: ProgressBar
var timer: Timer

func init(actor: Actor) -> void:
	# store child references
	progress_bar = $ProgressBar
	timer = $Timer
	$Label.text = actor.name
	timer.connect('timeout', actor._on_atb_timer_timeout)
	actor.connect('finish_change_turn', timer.start)
	progress_bar.max_value = timer.wait_time

func _process(_delta) -> void:
	progress_bar.value = timer.wait_time - timer.time_left
