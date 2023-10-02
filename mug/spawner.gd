extends Node3D

# @export var mug_scene: PackedScene

var mug_scene : PackedScene = preload("res://mug/mug.tscn")

func spawn():
	print("Mugmaking")
	var mug : Mug = mug_scene.instantiate() as Node3D
	var spawn_location = self.global_position
	
	spawn_location += Vector3(2*randf() - 1, 0, 2*randf() - 1)

	var down_speed = 3 * (randf() + 1) / 2
	var yaw_rate = 2 * (2 * randf() - 1)
	
	mug.position = spawn_location
	mug.linear_velocity = down_speed * Vector3.DOWN
	mug.angular_velocity = yaw_rate * Vector3.UP
	
	call_deferred("add_child", mug)

