extends Node3D



# create a list of the plant children for when we need to actually 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func load_single(pth):
	var ply_points = GDExample.new()
	ply_points.file_pth= pth
	ply_points.point_skip =5
	return ply_points
	
func load_move(pth,name,x,z):
	
	var points = load_single(pth)
	points.translate(Vector3(x,0,z))
	points.name = name+"_points" ## to distinguish this from the area components that will have the same name base
	add_child.call_deferred(points)
	return points
	
	
# eventually we could even have "load from cyverse" in here	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
