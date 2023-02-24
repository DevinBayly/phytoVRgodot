extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# help us determine what kind of action to do in main
var gui_area = true
var scrollNode: ScrollContainer 
var textureRect: TextureRect
# Called when the node enters the scene tree for the first time.
func _ready():
	scrollNode= $"../../Viewport/ScrollContainer"
	textureRect = $"../../Viewport/ScrollContainer/TextureRect"
	pass # Replace with function body.
var pos = 0
var last_ray_pos = 0
var change = 10
func update_scroll(new_ray_y_pos):
	var parent_aabb:AABB = $"../".get_transformed_aabb()
	var lower_y = parent_aabb.position.y
	var upper_y = parent_aabb.end.y
	var normalized_ray = (new_ray_y_pos - lower_y)/(upper_y-lower_y)
	scrollNode.set_v_scroll(normalized_ray*textureRect.rect_size.y)
	# we are sending controller raycast intersect position as mouse here
#	var delta =new_ray_y_pos - last_ray_pos
#	if delta >0:
#		pos -= change
#	else:
#		pos += change
#	last_ray_pos = new_ray_y_pos
#	pos = clamp(pos,0,textureRect.rect_size.y)
#	scrollNode.set_v_scroll(pos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
