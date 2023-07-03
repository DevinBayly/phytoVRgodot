extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var ply_points = GDExample.new()
	ply_points.file_pth= "./final_centered.ply"
	ply_points.point_skip =5
	add_child.call_deferred(ply_points)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
