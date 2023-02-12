extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_plant_name(name)
var selected_plant_name setget set_name
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_name(new_name):
	print("sidepanel setname called",new_name)
	emit_signal("change_plant_name",new_name)
	selected_plant_name = new_name
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
