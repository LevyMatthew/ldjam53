extends Node3D

# @export var mug_scene: PackedScene

var mug_scene : PackedScene = preload("res://mug/mug.tscn")

var counter = 0
var max_spawns = 50

func spawn():
	var mug : Mug = mug_scene.instantiate() as Node3D
	var w: float = 1
	var spawn_location = Vector3(w*(randf() - .5), 0, w*randf() - .5)
	
	

	var down_speed = 3 * (randf() + 1) / 2
	var yaw_rate = 2 * (2 * randf() - 1)
	
	mug.position = spawn_location
	mug.linear_velocity = down_speed * transform.basis.z
	mug.angular_velocity = yaw_rate * transform.basis.z
	
	counter += 1
	
	call_deferred("add_child", mug)
	
	if counter == max_spawns:
		$Timer.autostart = false

