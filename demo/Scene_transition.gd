extends CanvasLayer

func fade_out():
	$AnimationPlayer.play("dissolve")
	# this waits until the animation finishes
	yield($AnimationPlayer,"animation_finished")
	
func fade_in():
	$AnimationPlayer.play_backwards("dissolve")
	yield($AnimationPlayer,"animation_finished")
func change_the_scene(target):
	$AnimationPlayer.play("dissolve")
	# this waits until the animation finishes
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")
