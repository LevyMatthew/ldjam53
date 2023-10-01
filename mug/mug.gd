extends Node3D

class_name Mug

var top_y;
var bottom_y;

func _ready():
	# Clear the viewport.
	var viewport = $Viewport
	viewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	var texture_target: MeshInstance3D = $Cylinder
	var material: Material = texture_target.mesh.surface_get_material(0)
	material.albedo_texture = viewport.get_texture()
	texture_target.mesh.surface_set_material(0, material)
	#texture_target.material.albedo_texture = viewport.get_texture()

func set_wraparound(top_y: int, bottom_y: int):
	self.top_y = top_y
	self.bottom_y = bottom_y

func paste(decal: Decal, position: Vector3):
	#paste the decal onto the mug at position
	#just does the cosmetic stuff
	#game logic handled elsewhere
	pass
	
func on_paste(decal: Decal, position: Vector2):
	#local reaction to pasting
	#overlap detection
	pass
	
func map_3d_to_2d(position: Vector3) -> Vector2:
	#transformation between a 3D point and the 2D point
	#on the surface of the mug
	return Vector2(position.x, position.y)
