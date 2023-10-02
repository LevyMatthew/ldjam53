extends StaticBody3D

var inlet_area : Area3D

var mug : Mug

var outlet_A_open : bool = true
var outlet_B_open : bool = true

var printer_thrust = 2

@export var outlet_A : Node3D
@export var outlet_B : Node3D

@export var print_texture : Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	inlet_area = $InletArea


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inlet_area_body_entered(body):
	if is_instance_of(body, Mug):
		print("I found a mug!")
		self.mug = body
		if outlet_A_open:
			self.mug.global_position = outlet_A.global_position
			self.mug.linear_velocity = outlet_A.global_transform.basis.z * printer_thrust
		elif outlet_B_open:
			self.mug.global_position = outlet_B.global_position
			self.mug.linear_velocity = outlet_B.global_transform.basis.z * printer_thrust
		else:
			print("Blocked. Can't process mug")


func _on_inlet_area_body_exited(body):
	if is_instance_of(body, Mug):
		print("Mug left!")
