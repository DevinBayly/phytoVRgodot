extends Node3D
## bring in player, and use the experimental work from the plant loader 

@onready var plant_holder = $plant_holder
@onready var area_holder = $Areas_holder
var lim = 10
func load_from_json(jpth):
	# expects a file called load_configuration.json

	var reader = FileAccess.open(jpth,FileAccess.READ)

	var contents = reader.get_as_text()
	var json_res = JSON.parse_string(contents)
	for e in json_res:
		#print(e.path)
		## this is all to maek it possible to get the parent name of the folder that we are loading the plants relative to
		var relative_parent = "".join(jpth.split("/").slice(1,-1)).strip_edges()
		print(relative_parent)
		print(e.pth)
		var plant_name = e.pth.split("/")[1]
		print(plant_name)
		var full_asset_path = relative_parent+"/"+e.pth
		## here's where we could be loading all the things that get created per plant
		plant_holder.load_move(full_asset_path,plant_name,e.x,e.y)
		area_holder.create_move(plant_name,e.x,e.y)
		lim -=1
		if lim <0:
			break
# Called when the node enters the scene tree for the first time.
func _ready():
	load_from_json("res://assets/loading_configuration.json")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
