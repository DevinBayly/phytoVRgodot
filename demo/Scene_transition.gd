extends CanvasLayer
signal finished
func fade_out():
	
	$AnimationPlayer.play("dissolve")
	# this waits until the animation finishes
	yield($AnimationPlayer,"animation_finished")
	emit_signal("finished")
	print("fade out done, according to autoload scene")
	
func fade_in():
	$AnimationPlayer.play_backwards("dissolve")
	yield($AnimationPlayer,"animation_finished")
	emit_signal("finished")
	print("fade in done, according to autoload scene")
func change_the_scene(target):
	$AnimationPlayer.play("dissolve")
	# this waits until the animation finishes
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")
