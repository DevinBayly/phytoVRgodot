extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var data_window
var starting_pos
var adjusted_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func find_size():
	var control_group= get_tree().get_nodes_in_group("control")
	print(control_group)
	data_window = control_group[0]
	print(control_group)
	print(data_window.rect_position)
	print(data_window.rect_size)
	starting_pos = get_transform().get_origin()
	adjusted_pos = data_window.get_position()
	print("starting pos",starting_pos)
	print("adjusted_pos",adjusted_pos)
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_toggled(button_pressed):
	if button_pressed:
		set_position(Vector2(adjusted_pos.x,starting_pos.y))		
#		(Vector2(adjusted_pos,0))
	else:
		set_position(starting_pos)

#		translate(Vector2(starting_pos,0))
	#move the button to the edge of the extent
	pass # Replace with function body.




func _on_preloaded_image_sidepanel_resized():
	find_size()
	pass # Replace with function body.
