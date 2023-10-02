extends Node3D

var bodies

var downhill : Vector3
var downhill_force = 1

var left : Vector3
var centralizing_force = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	bodies = []
	downhill = global_transform.basis.z
	left = global_transform.basis.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in bodies:
		body.apply_force(downhill * downhill_force)
		
		var centralizing_force_direction = left * sign(global_position.x - body.global_position.x)
		body.apply_force(centralizing_force_direction * centralizing_force)

func _on_area_3d_body_entered(body):
	if body is Mug: 
		bodies.append(body)


func _on_area_3d_body_exited(body):
	if body is Mug:
		bodies.erase(body)
