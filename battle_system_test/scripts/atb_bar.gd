class_name ATBBar
extends HBoxContainer 

var progress_bar: ProgressBar
var timer: Timer

func init(actor: Actor) -> void:
	# store child references
	progress_bar = $ProgressBar
	timer = $Timer
	$Label.text = actor.name
	timer.connect('timeout', actor.on_timer_timeout)
	progress_bar.max_value = timer.wait_time

func _process(_delta) -> void:
	progress_bar.value = timer.wait_time - timer.time_left
