extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _input(event):
	if not event is InputEventKey:
		return
		
	if event.keycode == KEY_H:
		visible = event.is_pressed()

