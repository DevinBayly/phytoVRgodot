extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var childTexture: Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	print("passed texture is",childTexture)
	
	$TextureRect.texture = childTexture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
