extends Node3D

@onready var area_comp_scene = preload("res://area/area_component.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# this will be the function the main scenes make use of at load time to create an area component at the right location with the correct name

func create_move(plant_name,x,z):
	# make an instance of the area component and add it as a child`
	var area_comp: Node3D = area_comp_scene.instantiate()
	area_comp.name = plant_name +"_area"
	area_comp.translate(Vector3(x,0,z))
	add_child.call_deferred(area_comp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
