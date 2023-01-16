extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thread
var plant_count
onready var AreaDetector = preload("res://Area.tscn")
onready var point_class = preload("res://bin/new_nativescript.gdns")
signal plantcount(number)
# Called when the node enters the scene tree for the first time.
func _ready():
	plant_count =0
#	thread = Thread.new
	#load_from_json("./plants_load_order.json")
	single_plant()
#	thread.start(self,"load_from_json","./plants_load_order.json")

func single_plant():
	load_add_plant("/home/yara/Downloads/phyto_vr/lettuce/west/Grenadine_11/2020-03-02__01-50-23-120_cropped.ply")

func load_from_json(jpth):
	var reader = File.new()
	reader.open(jpth,File.READ)

	var contents = reader.get_as_text()
	var json_res = JSON.parse(contents)

	for e in json_res.result:
		#print(e.path)
		load_add_plant(e.path)
		plant_count +=1
		emit_signal("plantcount",plant_count)
		
func load_files():
	var dir = Directory.new()
	var path = "./plants"
	var lim = 1000
	
	
	
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "" and lim >0:
			
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				
				print("Found file: " + file_name)
				if ".ply" in file_name:
					lim = lim -1

					load_add_plant(path+"/"+file_name)
			file_name = dir.get_next()
			
	else:
		print("couldn't open path",path)

	pass # Replace with function body.

func load_add_plant(pth):
	#print("loading",pth)
	var pt = point_class.new()
	
	pt.file_pth =pth
	pt.point_skip = 300
	
	## this about  adding an area detector on top of the plant, set a variable on the area that will be a
	## point_class, 
	## when the area gets triggered on enter, it means that the point class needs to reload itself at higher amount
	## otherwise it needs to skip more points
	

	var child = pt.get_child(0)

	#print("points translation",pt.translation)

	#print("inside player")
	var pt_bb = child.get_aabb()
	#print(pt_bb)
	var pt_transform = pt_bb.get_center()
	#print("position to move area to is",pt_transform)
#	var area = AreaDetector.instance()
#	area.translate(pt_transform)
#	area.set_plant(pt)
#	call_deferred("add_child",area)
	
	
#	call_deferred("add_child",pt)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_head_collided(collider):
	print("looks like we  hit",collider)
	collider.change_me()
	pass # Replace with function body.


func _on_head_exited(collider):
	print("exited gaze")
	collider.left_me()

	pass # Replace with function body.
