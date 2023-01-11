extends Spatial

onready var A = preload("res://Area.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_head_collided(collider):
	print("looks like we  hit",collider)
	collider.change_me()
	pass # Replace with function body.


func _on_head_exited(collider):
	print("exited gaze")
	collider.left_me()
	pass # Replace with function body.
