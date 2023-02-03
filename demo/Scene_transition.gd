extends CanvasLayer
func change_the_scene(target):
	$AnimationPlayer.play("dissolve")
	# this waits until the animation finishes
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")
