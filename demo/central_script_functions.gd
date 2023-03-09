extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var lim = 10
var thread = null
var holder = null
var person = null
var ring = null
onready var point_class = preload("res://bin/new_nativescript.gdns")
onready var AreaDetector = preload("res://Area.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func full_scene_setup():
	thread = Thread.new()
	holder = $plant_holder
	ring = $test_collision_mouse/ring_import
	load_from_json("./drive_lettuce.json")
	#thread.start(self,"load_from_json","./drive_lettuce.json")

func load_from_folder():
	var dir = Directory.new()
	var path = "./plants"

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
	var number_loaded =0
	for e in json_res.result:
		number_loaded+=1
		#print(e.path)
		load_add_plant(e.path,number_loaded)
		lim -=1
		if lim <0:
			break


func load_add_plant(pth,num=0):
	print("loading",pth)
	
	# figure out a translation to apply given the num we are on with mod and floor
	var offset = Vector3(num%5,0,floor(num/5))
	var created_elements = make_pt_area(pth)
	var area = created_elements[0]
	var pt = created_elements[1]

	holder.call_deferred("add_child",pt)
	yield(pt.get_child(0),"tree_entered")
	pt.translate(offset*.5)
	var bb = pt.get_child(0).get_transformed_aabb()
	print(bb.get_center())
	area.translate(bb.get_center())

	holder.call_deferred("add_child",area)
	area.connect("activated",self,"trigger_side_panel")


func make_pt_area(pth,skip=20):
	var pt = point_class.new()
	pt.file_pth =pth
	
	pt.point_skip = skip
	
	
	# bring in the area and place at same locations
	var area = AreaDetector.instance()
	## strip out the part of the plant name that matches screenshots
	# they usually look like
	# /home/yara/Downloads/phyto_vr/3d_vr/3D_market_types/Butterhead/Blondine_109/final_centered.ply
	# so we need to split on / and take the 2nd to last
	
	area.plant_name = pth.split("/")[-2]
	
	if (pt.get_child_count() > 0) :
		
		area.set_plant(pt)
	return [area,pt]
		
	
	
# make a function that sets the name in the sidepanel when area elements change
func trigger_side_panel(pth):
	
	pass
#	$sidepanel_precreated_ims.selected_plant_name = pth
	# this will trigger the loading within it's own scene via signal emitted on set
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _exit_tree():
	if thread!= null and thread.is_active():
		thread.wait_to_finish()

var last_collided
func _on_OVRFirstPerson_handRayCollided(ob):
	last_collided = ob
	if "plant_area" in last_collided:
		# consider highlighting the plant area box temporarily
		last_collided.reveal_mesh()
	
	
	pass # Replace with function body.


func _on_OVRFirstPerson_handRayExited(ob):
	if "plant_area" in last_collided:
		if ob == null:
			return
		# consider highlighting the plant area box temporarily
		if "plant_area" in ob:
			ob.hide_mesh()

	if "gui_area" in last_collided:
		last_collided.last_ray_pos =0
	pass # Replace with function body.


func _on_OVRFirstPerson_handRayPoint(pos):
	# move the test collision mesh mark to the intersection of the ray and the object
	if "gui_area" in last_collided:

		# this is where we want to transmit the position to the window
		last_collided.update_scroll(pos.y)
	else:
		if ring != null:
			ring.transform.origin = pos
	
	pass # Replace with function body.


func _on_OVRFirstPerson_handSelected():
	if "plant_area" in last_collided:
		# trigger the point upsampling and such
		last_collided.external_selected()
	pass # Replace with function body.


func _on_OVRFirstPerson_handTrigger():
	# now want to move the plant_holder in the reverse direction so we never completely get out of teleporting option range
	# person - ring transform
	var start = ring.global_transform.origin 
	print("ring at",start)
	var end = person.global_transform.origin
	print("camera at",end)
	
	var movement_vec = end-start

	movement_vec.y = 0
	print("movement towards",movement_vec)
	var norm_move = movement_vec.normalized()
	holder.translate(norm_move)
#		person.transform.origin = current_pos
	pass # Replace with function body.
