extends Spatial

export var texture: Texture

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var vid_player = $video_render_player
# Called when the node enters the scene tree for the first time.
func _ready():
	$Viewport/ScrollContainer/TextureRect.texture = texture
	
	pass # Replace with function body.

func set_video(stream):
	vid_player.set_stream(stream)
	
func play_video():
	vid_player.play_stream()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
