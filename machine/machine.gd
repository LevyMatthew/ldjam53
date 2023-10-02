extends RigidBody3D



var brake_rate = 3
var accel_rate = 2

var turn_speed = 5

var damping = 0.999
var air_friction = 0.01

var left_down = false
var right_down = false
var gas_down = false
var back_down = false

var bodies

var held_root: Node3D
var held_body: Node3D #what we're holding rn (or just held, if empty = true)
var empty: bool = true #holding nothing

var camera: Camera3D
@export var main_camera: Camera3D
@export var cosmetic_machine : MachineCosmetic

func _on_body_entered(body):
	if is_instance_of(body, Mug):
		bodies.append(body)

func _on_body_exited(body):
	if is_instance_of(body, Mug):
		bodies.erase(body)

func _ready():
	self.bodies = []
	self.held_root = $Held
	# self.cosmetic_machine = $MachineCosmetic
	self.camera = $Camera
	self.main_camera = get_node("/root/Main/MainCamera")

func on_open():
	if self.empty:
		for body in bodies:
			self.held_body = body
			body.get_parent().remove_child(body)
			self.held_root.add_child(body)
			body.global_position = self.held_root.global_position
			break
	cosmetic_machine.on_open() 
	#poll for mugs
	#pick first mug
	
func on_close():
	self.empty = true
	if self.held_body:
		self.held_root.remove_child(self.held_body)
		var new_parent = get_node("/root/Main/MugSpawner")
		new_parent.add_child(self.held_body)
		self.held_body.global_position = self.held_root.global_position
	
	self.held_body = null
	self.bodies = []
	cosmetic_machine.on_close()

func _input(event):
	if not event is InputEventKey:
		return

	if event.is_pressed():
		if event.keycode == KEY_T:
			camera.current = not camera.current
			pass
			
		if event.keycode == KEY_SPACE:
			on_open()
			
		if event.keycode in [KEY_W, KEY_UP]:
			gas_down = true
			
		if event.keycode in [KEY_S, KEY_DOWN]:
			back_down = true
			
		if event.keycode in [KEY_A, KEY_LEFT]:
			left_down = true
		
		elif event.keycode in [KEY_D, KEY_RIGHT]:
			right_down = true
	
	if event.is_released():
		if event.keycode == KEY_SPACE:
			on_close()
			
		if event.keycode in [KEY_W, KEY_UP]:
			gas_down = false
			
		if event.keycode in [KEY_S, KEY_DOWN]:
			back_down = false
			
		if event.keycode in [KEY_A, KEY_LEFT]:
			left_down = false
		
		elif event.keycode in [KEY_D, KEY_RIGHT]:
			right_down = false


func _physics_process(delta):
	
	if self.held_body:
		self.held_body.global_position = self.held_root.global_position
	
	self.linear_velocity *= self.damping
	
	if gas_down:
		gas()
	
	if back_down:
		back()
		
	if left_down:
		left()
	
	if right_down:
		right()
		
	if not (left_down or right_down):
		straight()
	
	if self.linear_velocity != Vector3.ZERO:
		var old = self.linear_velocity
		var new = old - self.air_friction * self.linear_velocity * self.linear_velocity.length()
		if new.dot(old) < 0:
			self.linear_velocity = Vector3.ZERO			
		else:
			self.linear_velocity = new
	

func gas():
	#self.linear_velocity += f
	print("VROOM")
	self.linear_velocity -= self.global_transform.basis.z * accel_rate
	
func back():
	print("SKRT")
#	if self.linear_velocity.dot(self.global_transform.basis.z) >= 0:
#		self.linear_velocity += self.linear_velocity.normalized() * brake_rate
#	if self.linear_velocity != Vector3.ZERO \
#		and self.linear_velocity.length_squared() < brake_rate / 2:
#		self.linear_velocity = Vector3.ZERO
#	else:
	self.linear_velocity += self.global_transform.basis.z * brake_rate

func left():
	self.angular_velocity = Vector3.UP * turn_speed
	pass
	
func right():
	self.angular_velocity = -Vector3.UP * turn_speed
	pass

func straight():
	self.angular_velocity = Vector3.ZERO
	pass
