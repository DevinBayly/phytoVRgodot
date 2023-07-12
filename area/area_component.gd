extends Node3D
## things this script needs to handle
# creation of 

var selected=false
@onready var inner_node = $inner_node
@onready var wireframe = $inner_node/wireframe

signal activated(name)
signal deactivated(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func selected_by_vr():
	general_selection_actions()
	pass
func selected_by_mouse():
	general_selection_actions()
	pass

func general_selection_actions():
	# this is the kind of thing that needs to happen no matter how we got originally selected
	selected=!selected
	print("selection changing")
	wireframe.visible = selected
	if selected:
		activated.emit(name)
	else:
		deactivated.emit(name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_3d_input_event(camera:Node, event:InputEvent, position:Vector3, normal:Vector3, shape_idx:int):
	if event is InputEventMouseButton:
		if event.double_click:
			selected_by_mouse()
	pass
