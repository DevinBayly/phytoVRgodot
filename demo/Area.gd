extends Area

onready var active_mat = preload("res://active.tres")
onready var inactive_mat = preload("res://inactive.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var mesh:MeshInstance
var plant
# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = $MeshInstance
	pass # Replace with function body.

func set_plant(p):
	plant =p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_me():
	print(mesh)
	print(mesh.mesh)
	mesh.mesh.surface_set_material(0,active_mat)
	print("getting changed")
	print("plant has been set to ",plant)
	plant.point_skip = 1
	
func left_me():
	print(mesh)
	print(mesh.mesh)
	mesh.mesh.surface_set_material(0,inactive_mat)
	print("gaze has exited")
	print("plant has been set to ",plant)
	plant.point_skip = 300
