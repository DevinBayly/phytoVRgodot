extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var rotateScale = .01
var torso
var cam
# Called when the node enters the scene tree for the first time.
func _ready():
	torso = $torso
	cam = $torso/Camera
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
func _input(event):
	
	if event is InputEventMouseMotion :
		print(event.relative)
		self.rotate_y(-event.relative.x*rotateScale)
		torso.rotate_x(-event.relative.y*rotateScale)
		
