extends Node3D


var plant_loader = preload("res://plant_loader/plant_loader.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var points = plant_loader.load_single("assets/plant_plys/GRxI_1004_88_timeseries/2020-03-01_final_centered.ply")
	print(points)
	add_child.call_deferred(points)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
