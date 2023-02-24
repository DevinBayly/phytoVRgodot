extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var lim = 10
var thread
var holder
var person
var ring
onready var point_class = preload("res://bin/new_nativescript.gdns")
onready var AreaDetector = preload("res://Area.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	thread = Thread.new()
	holder = $plant_holder
	person = $OVRFirstPerson
	ring = $test_collision_mouse/ring_import
	thread.start(self,"load_from_json","./drive_lettuce.json")
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
	var pt = point_class.new()
	# figure out a translation to apply given the num we are on with mod and floor
	var offset = Vector3(num%5,0,floor(num/5))
	pt.file_pth =pth
	
	pt.point_skip = 20
	pt.translate(offset*.5)
	holder.call_deferred("add_child",pt)
	# bring in the area and place at same locations
	var area = AreaDetector.instance()
	## strip out the part of the plant name that matches screenshots
	# they usually look like
	# /home/yara/Downloads/phyto_vr/3d_vr/3D_market_types/Butterhead/Blondine_109/final_centered.ply
	# so we need to split on / and take the 2nd to last
	
	area.plant_name = pth.split("/")[-2]
	
	if (pt.get_child_count() > 0) :
		var bb = pt.get_child(0).get_transformed_aabb()
		area.translate(bb.get_center())
		area.set_plant(pt)
		holder.call_deferred("add_child",area)
		area.connect("activated",self,"trigger_side_panel")
	
	
# make a function that sets the name in the sidepanel when area elements change
func trigger_side_panel(pth):
	pass
#	$sidepanel_precreated_ims.selected_plant_name = pth
	# this will trigger the loading within it's own scene via signal emitted on set
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _exit_tree():
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
		# consider highlighting the plant area box temporarily
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
	var movement_vec = person.transform.origin - ring.transform.origin
	movement_vec.y = 0
	var norm_move = movement_vec.normalized()
	$plant_holder.translate(norm_move)
#		person.transform.origin = current_pos
	pass # Replace with function body.
