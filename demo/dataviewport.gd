extends Viewport


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#normalized values for 


# Called when the node enters the scene tree for the first time.
func _ready():
	size.x = $ScrollContainer/TextureRect.rect_size.x
	var mesh_scale = $"../MeshInstance".scale
	size.y = size.x*(1/mesh_scale.x)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
