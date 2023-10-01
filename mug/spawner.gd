extends Node3D

# @export var mug_scene: PackedScene

var mug_scene : PackedScene = preload("res://mug/mug.tscn")

@export var top_y = 5
@export var bottom_y = -6

var area: Area3D
# Called when the node enters the scene tree for the first time.
func _ready():
	area = $Area3D

func get_random_location_in_box():
	var h_variance = 2
	return area.position + Vector3(h_variance * (randf() - 0.5),top_y,h_variance * (randf() - 0.5))

func spawn():
	var mug : Mug = mug_scene.instantiate() as Node3D
	var spawn_location = get_random_location_in_box()

	var down_speed = 3 * (randf() + 1) / 2
	var yaw_rate = 2 * (2 * randf() - 1)
	
	mug.position = spawn_location
	mug.set_wraparound(top_y, bottom_y)
	mug.linear_velocity = down_speed * Vector3.DOWN
	mug.angular_velocity = yaw_rate * Vector3.UP
	
	call_deferred("add_child", mug)
	
func _on_timer_timeout():
	spawn()
