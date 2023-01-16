extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var point_class = preload("res://bin/new_nativescript.gdns")
# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	var path = "./plants"
	var lim = 40
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

func load_add_plant(pth):
	print("loading",pth)
	var pt = point_class.new()
	pt.file_pth =pth
	add_child(pt)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
