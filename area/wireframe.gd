extends Node3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#
	# get the coordinates of a cube with 1 dist vertices
	var vertices = PackedVector3Array()
	#lower set
	vertices.push_back(Vector3(0, 0, 0))
	vertices.push_back(Vector3(1, 0, 0))
	vertices.push_back(Vector3(1, 0, 1))
	vertices.push_back(Vector3(0, 0, 1))
	vertices.push_back(Vector3(0, 0, 0))
	#upper row
	vertices.push_back(Vector3(0, 1, 0))
	vertices.push_back(Vector3(1, 1, 0))
	vertices.push_back(Vector3(1, 1, 1))
	vertices.push_back(Vector3(0, 1, 1))
	vertices.push_back(Vector3(0, 1, 0))
	# individual vertical connectors
	vertices.push_back(Vector3(1, 1, 0))
	vertices.push_back(Vector3(1, 0, 0))
	vertices.push_back(Vector3(1, 0, 1))
	vertices.push_back(Vector3(1, 1, 1))
	vertices.push_back(Vector3(0,1,1))
	vertices.push_back(Vector3(0,0,1))
	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(ArrayMesh.ARRAY_MAX)
	arrays[ArrayMesh.ARRAY_VERTEX] = vertices
	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINE_STRIP, arrays)
	var m = MeshInstance3D.new()
	
	m.mesh = arr_mesh
	var res = Resource.new()
	res.resource_name="wirebox.tres"
	
	ResourceSaver.save(res, arr_mesh, ResourceSaver.FLAG_COMPRESS)
	add_child(m)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
