extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var texrect 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# need something that will tell us which image to load
func load_im(im_path):
	var im = Image.new()
	im.load(im_path)
	texrect = TextureRect.new()
	texrect.texture = im
	add_child(texrect)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_toggled(button_pressed):
	print(button_pressed)
	visible = button_pressed
	pass # Replace with function body.


func _on_sidepanel_precreated_ims_change_plant_name(name):
	#doign it this way, the image will always be visible but out of view initially
	texrect.queue_free()
	load_im(name)
	pass # Replace with function body.