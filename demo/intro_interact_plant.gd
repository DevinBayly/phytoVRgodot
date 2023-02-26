extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var AreaDetector = preload("res://Area.tscn")
export var rate = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	# add an area to the plant
	var area = AreaDetector.instance()
	## strip out the part of the plant name that matches screenshots
	# they usually look like
	# /home/yara/Downloads/phyto_vr/3d_vr/3D_market_types/Butterhead/Blondine_109/final_centered.ply
	# so we need to split on / and take the 2nd to last
	
	area.plant_name = name
	
	
	var bb = get_aabb()
	area.translate(bb.get_center())
	add_child(area)
#	area.get_node("MeshInstance").visible=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	#rotate(Vector3(0,1,0),rate*delta)
	pass
