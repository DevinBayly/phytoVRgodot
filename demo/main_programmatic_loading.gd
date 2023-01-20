extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var point_class = preload("res://bin/new_nativescript.gdns")
onready var AreaDetector = preload("res://Area.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	load_from_json("./plants_load_order.json")
func load_from_folder():
	var dir = Directory.new()
	var path = "./plants"
	var lim = 4
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "" and lim >0:
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if ".ply" in file_name:
					print("Found file: " + file_name)
					lim -=1
					load_add_plant(path+"/"+file_name)
			file_name = dir.get_next()
			
	else:
		print("couldn't open path",path)

	pass # Replace with function body.
func load_from_json(jpth):
	var reader = File.new()
	reader.open(jpth,File.READ)

	var contents = reader.get_as_text()
	var json_res = JSON.parse(contents)
	var lim = 10
	for e in json_res.result:
		#print(e.path)
		load_add_plant(e.path)
		lim -=1
		if lim <0:
			break


func load_add_plant(pth):
	print("loading",pth)
	var pt = point_class.new()
	pt.file_pth =pth
	add_child(pt)
	# bring in the area and place at same locations
	var area = AreaDetector.instance()
	var bb = pt.get_child(0).get_aabb()
	area.translate(bb.get_center())
	area.set_plant(pt)
	add_child(area)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_head_collided(collider):
	# these will be area boxes
	collider.change_me()
	pass # Replace with function body.


func _on_head_exited(collider):
	collider.left_me()
	pass # Replace with function body.
