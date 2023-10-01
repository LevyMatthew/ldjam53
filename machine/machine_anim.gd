extends Node3D
class_name MachineCosmetic

var open = false

var opening = false

var held_item: Node3D = null
var grip_detect_area

#var closed_angle_l = -30
#var closed_angle_r = 30
#var open_angle_l = 35
#var open_angle_r = -35
#
var closed_angle_l = 0
var closed_angle_r = 0
var open_angle_l = 40
var open_angle_r = -40

var left_grip : Node3D
var right_grip : Node3D
#var left_joint : Generic6DOFJoint3D
#var right_joint : Generic6DOFJoint3D
# Called when the node enters the scene tree for the first time.
func _ready():
	left_grip = $GripL
	right_grip = $GripR
	
#	left_joint.set_flag_y(left_joint.FLAG_ENABLE_ANGULAR_LIMIT, false)
#	right_joint.set_flag_y(right_joint.FLAG_ENABLE_ANGULAR_LIMIT, false)

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



#	left_joint.set_param_y(left_joint.PARAM_ANGULAR_SPRING_EQUILIBRIUM_POINT, left_grip.rotation_degrees.y)
#	right_joint.set_param_y(right_joint.PARAM_ANGULAR_SPRING_EQUILIBRIUM_POINT, right_grip.rotation_degrees.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target_l : float = 0
	var target_r : float = 0
	var current_angle : float = self.rotation_degrees.z
	var lerp_speed = 0.9
	var torque : float = 10

#	if opening and not open: #opening
#		if left_grip.rotation_degrees.y < open_angle_l:
##			left_joint.set_flag_y(left_joint.FLAG_ENABLE_MOTOR, true)
##			left_joint.set_param_y(left_joint.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY, torque)
##			right_joint.set_flag_y(right_joint.FLAG_ENABLE_MOTOR, true)
##			right_joint.set_param_y(right_joint.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY, -torque)
#			left_grip.rotation_degrees.y = open_angle_l
#			right_grip.rotation_degrees.y = open_angle_r
#		else:
#			stop_grips()
#			open = true
#			opening = false
#
#
#	if not opening and open: #closing
#		if left_grip.rotation_degrees.y > closed_angle_l:
##			left_joint.set_flag_y(left_joint.FLAG_ENABLE_MOTOR, true)
##			left_joint.set_param_y(left_joint.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY, -torque)
##			right_joint.set_flag_y(right_joint.FLAG_ENABLE_MOTOR, true)
##			right_joint.set_param_y(right_joint.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY, torque)
#			left_grip.rotation_degrees.y = closed_angle_l
#			right_grip.rotation_degrees.y = closed_angle_r
#
#
#		else:
#			stop_grips()
#			open = false
#			opening = false
			

