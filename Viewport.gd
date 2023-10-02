extends SubViewport

var t = 0;
var done = false

var mugoclock : Node2D 
var instructions : Node2D
var timer : Timer 
var rabbit : Node2D 
var rabbit_2 : Node2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	mugoclock = $MugOClock
	instructions = $Instructions
	timer = $Timer
	rabbit = $Rabbit
	rabbit_2 = $Rabbit2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta

	rabbit.position.y += sin(t)
	rabbit.position.x += cos(t) - t


	rabbit_2.position.y += -sin(t)
	rabbit_2.position.x += t - cos(t)
	
	if t > 6:
		mugoclock.position.x = 50
		instructions.position.x = 75
		timer.start()


func _on_timer_timeout():
	pass # Replace with function body.
