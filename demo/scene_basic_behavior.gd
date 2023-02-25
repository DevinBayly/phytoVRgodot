extends Spatial

signal finished
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var anim

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AudioStreamPlayer/AnimationPlayer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("finished")
	#SceneTransition.change_the_scene("res://scene2.tscn")
	pass # Replace with function body.
