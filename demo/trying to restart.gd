extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var point_class = preload("res://bin/new_nativescript.gdns")

# Called when the node enters the scene tree for the first time.
func _ready():
	var pt = point_class.new()
	pt.file_pth= "./plants/plant240.ply"
	add_child(pt)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
