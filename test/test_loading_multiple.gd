extends Node3D

var plant_loader = preload("res://plant_loader/plant_loader.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child.call_deferred(plant_loader)
	plant_loader.load_from_json("res://assets/loading_configuration.json")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
