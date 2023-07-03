extends Node3D

@onready var cam = $Camera3D
@export var sensitivity =.1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var prev_press = false
func _input(event):
	if event is InputEventMouseMotion and prev_press:

		## need to rotate self around x to change height, but do the camera around y separately
		rotate_x(-1*deg_to_rad(event.relative.y*sensitivity))
		## clamp in a moment so that we don't go upsidown
		
		cam.rotate_y(-1*deg_to_rad(event.relative.x*sensitivity))
		
		#rotation_degrees.x  = clamp(rotation.x,-70,70)

	if event is InputEventMouseButton:
		prev_press =! prev_press 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
