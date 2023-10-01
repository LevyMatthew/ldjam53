extends Timer

var counter = 0

@export var count = 10

func _ready():
	counter = 0

func _on_timeout():
	counter += 1
	if counter == count:
		self.stop()
