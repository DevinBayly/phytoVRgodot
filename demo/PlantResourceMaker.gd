extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var point_class = preload("res://bin/new_nativescript.gdns")
var plant_names = [
	
		"Aido_95"
]
var folders= [
	"Butterhead",
	"Cos",
	"Crisp",
	"Cutting",
	"Latin"
]
var base = "3d_vr/3D_market_types/%s/%s/final_centered.ply"
# Called when the node enters the scene tree for the first time.
func _ready():
	# make 5 plants
	print("starting up")
	for i in range(folders.size()):
		var name = plant_names[i]
		var folder = folders[i]
		print("name is ",name)
		print("base is ",base%[folder,name])
		load_add_plant(name,folder)
	pass # Replace with function body.

func load_add_plant(name,folder):
	print("making child")
	var pt = point_class.new()
	# figure out a translation to apply given the num we are on with mod and floor

	pt.file_pth =base%[folder,name]
	
	pt.point_skip = 1
	var child = pt.get_children()[0]

	ResourceSaver.save("res://%s.tres"%name,child.mesh, ResourceSaver.FLAG_COMPRESS)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#
