extends Viewport


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var video:VideoPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	# connect replay to the child video
	video = find_node("VideoPlayer")
	video.connect("finished",self,"restart")
	pass # Replace with function body.


func restart():
	video.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
