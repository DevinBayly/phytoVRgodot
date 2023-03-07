extends "res://scene_basic_behavior.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var main_reactor 
onready var person = $OVRFirstPerson
# Called when the node enters the scene tree for the first time.
func _ready():
	main_reactor = $main_reactor_scene_6
	main_reactor.person = person
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OVRFirstPerson_handRayCollided(ob):
	main_reactor._on_OVRFirstPerson_handRayCollided(ob)
	pass # Replace with function body.


func _on_OVRFirstPerson_handRayExited(ob):
	main_reactor._on_OVRFirstPerson_handRayExited(ob)
	pass # Replace with function body.


func _on_OVRFirstPerson_handSelected():
	main_reactor._on_OVRFirstPerson_handSelected()
	pass # Replace with function body.


func _on_OVRFirstPerson_handRayPoint(pos):
	main_reactor._on_OVRFirstPerson_handRayPoint(pos)
	pass # Replace with function body.


func _on_OVRFirstPerson_handTrigger():
	main_reactor._on_OVRFirstPerson_handTrigger()
	pass # Replace with function body.
