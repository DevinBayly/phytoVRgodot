extends CharacterBody3D


@export var sensitivity =.1
@export var use_gravity: bool = false
@export var SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var cam = $rotation_helper/Camera3D
@onready var helper = $rotation_helper
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


var prev_press = false
func _input(event):
	if event is InputEventMouseMotion and prev_press:

		## need to rotate self around x to change height, but do the camera around y separately
		helper.rotate_x(-1*deg_to_rad(event.relative.y*sensitivity))
		## clamp in a moment so that we don't go upsidown
		
		rotate_y(-1*deg_to_rad(event.relative.x*sensitivity))
		var cam_rot= helper.rotation_degrees
		cam_rot.x = clamp(cam_rot.x,-70,70)
		helper.rotation_degrees = cam_rot
		#rotation_degrees.x  = clamp(rotation_degrees.x,-70,70)

	if event is InputEventMouseButton:
		prev_press =! prev_press 


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and use_gravity:
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (cam.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
