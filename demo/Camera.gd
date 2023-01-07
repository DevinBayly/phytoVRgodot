extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var mat = preload("res://mat.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("player ready")
#	var pts = $"../Points2"
#	var child = pts.get_child(0)
#	child.set_surface_material(0,mat)
#	print("points translation",pts.translation)
#	print(child.global_translation)
#	print("inside player")
#	var bb = child.get_aabb()
#	print("points aabb is",bb)
#	var trans_location = bb.position - Vector3(2,0,0)
#	translate(trans_location)
#	look_at(bb.position,Vector3(0,1,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

