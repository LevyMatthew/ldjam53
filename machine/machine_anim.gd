extends Node3D
class_name MachineCosmetic

var open = false

var opening = false


var closed_angle_l = 0
var closed_angle_r = 0
var open_angle_l = 40
var open_angle_r = -40

var left_grip : Node3D
var right_grip : Node3D

func _ready():
	left_grip = $GripL
	right_grip = $GripR

func on_open():
	opening = true
	open = true
	print("Opening")
	left_grip.rotation_degrees.y = open_angle_l
	right_grip.rotation_degrees.y = open_angle_r

func on_close():
	opening = false
	open = false
	print("Closing")
	left_grip.rotation_degrees.y = closed_angle_l
	right_grip.rotation_degrees.y = closed_angle_r

func stop_grips():
	print("STOP")
