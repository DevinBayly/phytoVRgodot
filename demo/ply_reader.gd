extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var pscale = 100
onready var mat = preload("res://first_mat.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	var f = File.new()
	f.open("./plant.ply",File.READ)
	# skip past first number of lines (12)
	var total = f.get_len()
	var header = []
	for i in range(11):
		header.append(f.get_line())
	print(header)
#	var buf = f.get_buffer()
#	var pos = f.get_position()
#	var buf = f.get_buffer(total-pos)
	var vertices = PoolVector3Array()
	var colors = PoolColorArray()
	while not f.eof_reached():
		### get the xyz, then get the uchar colors


		var x = f.get_double() 
		var z = f.get_double()
		var y = f.get_double()
		var r = f.get_8()
		var g = f.get_8()
		var b = f.get_8()
		if (x != 0):
			vertices.push_back(Vector3(x-409003.9375,y-0.967674,z- 3659981.5 ))
			colors.push_back(Color(r/256.0,g/256.0,b/256.0))
	
	print(vertices[0])
	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(ArrayMesh.ARRAY_MAX)
	arrays[ArrayMesh.ARRAY_VERTEX] = vertices
	arrays[ArrayMesh.ARRAY_COLOR] = colors
	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS, arrays)
	var m = MeshInstance.new()
	arr_mesh.surface_set_material(0,mat)
	m.mesh = arr_mesh
	
	var c = $"../Camera"
	
	m.set_scale(Vector3(10,10,10))
	
	var bb=m.get_aabb()
	c.translate(bb.position)
	c.look_at(bb.get_center(),Vector3(0,1,0))
	add_child(m)
#	m.translate(-bb.position)
	bb = m.get_aabb()
	print(bb)
	print(c.transform)
#	ResourceSaver.save("res://plant.tres", arr_mesh, ResourceSaver.FLAG_COMPRESS)
#		print("%f %f %f %d %d %d " % [x,y,z,r,g,b])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
