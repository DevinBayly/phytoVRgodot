extends "res://central_script_functions.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	full_scene_setup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OVRFirstPerson_controllerActive(ob):
	person = ob
	pass # Replace with function body.


func _on_Timer_timeout():
	print("my person is",person.controller_id)
	
	print("basic transform", person.transform.origin)
	print("global", person.global_transform.origin)
	pass # Replace with function body.
