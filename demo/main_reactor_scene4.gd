extends "res://central_script_functions.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	thread = Thread.new()
	# in theory we could still path to these, without being their parent. might still work
	thread.start(self,"create_plants")
	
	## set up signals to the vr so that things happen the way they are supposed to
	# check if we can find a headset  node that emits the things that 
	
	pass # Replace with function body.

func create_plants():
	# load up 5 plants and place them in the locations of the child spatials
	var children = get_children()
	print("these are all the children",children)
	# use their names for paths in to the files
	for child in children:
		
		var pname = child.name
		var group = pname.split(" ")[0]
		var individual = pname.split(" ")[1]
		# get back an area and a ply pt generated ob
		var created_elements = make_pt_area("3d_vr/3D_market_types/%s/%s/final_centered.ply"%[group,individual])
		print("created elements are",created_elements)
		#  move them to the locations of the spatials
		# well really, just remove the translate on both, and then parent to the 
		child.call_deferred("add_child",created_elements[0])
		child.call_deferred("add_child",created_elements[1])
		print("added to ",child)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _exit_tree():
	if thread!= null and thread.is_active():
		thread.wait_to_finish()

