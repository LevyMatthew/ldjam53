extends Node3D

class_name Mug

var top_y;
var bottom_y;

var viewport
var texture_target: MeshInstance3D
var material: Material

func _ready():
	# Clear the viewport.
	viewport = $Viewport
	viewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	texture_target = $Cylinder
	material = texture_target.mesh.surface_get_material(0)
	material.albedo_texture = viewport.get_texture()
	texture_target.mesh.surface_set_material(0, material)
	#texture_target.material.albedo_texture = viewport.get_texture()
