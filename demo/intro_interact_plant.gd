extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var AreaDetector = preload("res://Area.tscn")
export var rate = .5

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	rotate(Vector3(0,1,0),rate*delta)
	pass
