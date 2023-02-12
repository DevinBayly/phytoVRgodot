extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var im = Image.new()
	im.load("res://screenshots/Blondine_109_vis.png")
	var rect = TextureRect.new()
	rect.texture = im
	add_child(rect)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
