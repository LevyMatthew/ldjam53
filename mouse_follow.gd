extends Node3D


var dragging = false
var click_radius = 32 # Size of the sprite.

var sprite;

@export var camera3d : Camera3D

func _input(event):
	sprite = $Sprite3D
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		return
		if (event.position - sprite.position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false

func _process(delta):
	const RAY_LENGTH = 1000.0
	var mouse_position = get_viewport().get_mouse_position()
	var from = camera3d.project_ray_origin(mouse_position)
	var to = from + camera3d.project_ray_normal(mouse_position) * RAY_LENGTH

