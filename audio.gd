extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if not event is InputEventKey:
		return

	if event.is_pressed():
		if event.keycode == KEY_M:
			self.playing = !self.playing



func _on_finished():
	self.play()
