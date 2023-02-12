extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



var texrect =null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# need something that will tell us which image to load
func load_im(im_path):
	var im = Image.new()
	# modify the path so that we get the right image
	im.load("res://screenshots/%s_vis.png"%im_path)
	texrect = TextureRect.new()
	texrect.texture = im
	$VFlowContainer.add_child(texrect)
	print("done adding")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_toggled(button_pressed):
	print(button_pressed)
	visible = button_pressed
	pass # Replace with function body.


func _on_sidepanel_precreated_ims_change_plant_name(name):
	print("about to add image to the vflow",name)
	#doign it this way, the image will always be visible but out of view initially
	if texrect != null:
		texrect.queue_free()
	load_im(name)
	pass # Replace with function body.
