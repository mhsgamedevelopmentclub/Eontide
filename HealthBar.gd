extends ProgressBar

@onready var timer= $Timer
@onready var progress_bar = $ProgressBar

var health = 100

func _ready():
	value = health
	timer.start()

func _on_timer_timeout():
	var prev_health = health
	health = health - 5
	value = health
	
	if health <= 0:
		print("dead")
		
	timer.start()
