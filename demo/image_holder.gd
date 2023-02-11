extends VBoxContainer
var loader= false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wait_frames

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
#	get_image("./screenshots/Aido_95_vis.png")
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() -1)
	print(current_scene)


	pass # Replace with function body.

func get_image():
	wait_frames = 10
	SceneTransition.fade_out()
	loader = ResourceLoader.load_interactive("res://many_images.tscn")
	set_process(true)
	get_node("loading_window").get_node("AnimationPlayer").play("spinwheel")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if loader == null:
		set_process(false)
		return
	if wait_frames >0:
		wait_frames -=1
		return
	var t = OS.get_ticks_msec()
	var wait_time = 20
	while OS.get_ticks_msec() < t+ wait_time:
		var err = loader.poll()
		print(loader.get_stage()," , out of", loader.get_stage_count())
		if err == ERR_FILE_EOF:
			print("loaded, done")
			visible = false
			print("starting fade")
			SceneTransition.fade_in()
			print("faded all the way in")
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred("add_child",resource.instance())
			# should we then remove the loading window?
			set_process(false)
			
			break
		else:
			print(err)
	pass


func _on_Button_pressed():
	visible = true
	get_image()
	pass # Replace with function body.
