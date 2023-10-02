extends Node3D



func _ready():
	# Clear the viewport.
	var viewport = $Viewport
	viewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	var texture_target: MeshInstance3D = $Level/Screen/Screen
	var material: Material = texture_target.mesh.surface_get_material(0)
	material.albedo_texture = viewport.get_texture()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
