extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func load_single(pth):
	var ply_points = GDExample.new()
	ply_points.file_pth= pth
	ply_points.point_skip =5
	return ply_points
	
func load_move(pth,x,z):
	var points = load_single(pth)
	points.translate(Vector3(x,0,z))
	return points
var lim = 10
func load_from_json(jpth):
	# expects a file called load_configuration.json

	var reader = FileAccess.open(jpth,FileAccess.READ)

	var contents = reader.get_as_text()
	var json_res = JSON.parse_string(contents)
	var number_loaded =0
	for e in json_res:
		number_loaded+=1
		#print(e.path)
		## this is all to maek it possible to get the parent name of the folder that we are loading the plants relative to
		var relative_parent = "".join(jpth.split("/").slice(1,-1)).strip_edges()
		print(relative_parent)
		var points = load_move(relative_parent+"/"+e.pth,e.x,e.y)
		print(points)
		#load_add_plant(e.path,number_loaded)
		add_child.call_deferred(points)
		lim -=1

		if lim <0:
			break
	
	
# eventually we could even have "load from cyverse" in here	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
