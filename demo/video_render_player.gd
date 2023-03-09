extends Spatial

export var vid:VideoStream
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Viewport/sanity_chcek/AspectRatioContainer/VideoPlayer
	
	
	pass # Replace with function body.
func set_stream(stream):
	player.stream= load(stream)
func play_stream():
	player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
