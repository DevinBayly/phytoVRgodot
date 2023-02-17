extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal intersect_pos(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var timeout =0
func _on_Area_input_event(camera, event, position, normal, shape_idx):
	
	if OS.get_ticks_msec()- timeout > 100:

		emit_signal("intersect_pos",position)
		timeout = OS.get_ticks_msec()
		$ring_import.transform.origin = position
	pass # Replace with function body.


func _on_Area_mouse_entered():
	print("mouse entered")
	pass # Replace with function body.
