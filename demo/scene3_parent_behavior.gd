extends "res://scene_basic_behavior.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var main_reactor = $main_reactor
# Called when the node enters the scene tree for the first time.
func _ready():
	
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
