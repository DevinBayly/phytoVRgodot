extends Area

onready var active_mat = preload("res://active.tres")
onready var inactive_mat = preload("res://inactive.tres")
var thread
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal activated(pth)
var mesh:MeshInstance
var plant
var plant_name
const plant_area = true
# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = $MeshInstance
	mesh.visible = false
	thread = Thread.new()
	pass # Replace with function body.

func set_plant(p):
	plant =p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func thread_update(val):
	plant.point_skip = val
func change_me():
	print("in area about to activate, plant name is",plant_name)
	emit_signal("activated",plant_name)
	print(mesh)
	print(mesh.mesh)
	mesh.visible= true
	print("getting changed")
	print("plant has been set to ",plant)

	if thread.is_active():
		thread.wait_to_finish()
	thread.start(self,"thread_update",1)
	
func reveal_mesh():
	mesh.visible = true
func hide_mesh():
	mesh.visible = false
func left_me():
	print(mesh)
	print(mesh.mesh)
	mesh.visible = false

	print("gaze has exited")
	print("plant has been set to ",plant)

	if thread.is_active():
		thread.wait_to_finish()
	thread.start(self,"thread_update",300)
func _exit_tree():
	if thread.is_active():
		thread.wait_to_finish()

func decide_action():
	if selected:
		
		# this means we should load hi fidelity
		change_me()
	else:
		left_me()

var selected = false
func external_selected():
	selected = !selected
	decide_action()
func _on_Area_input_event(camera, event:InputEvent, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.doubleclick:
			selected = !selected
			decide_action()
	pass # Replace with function body.
