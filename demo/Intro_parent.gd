extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#consider adding the main application as a scene at the end that we go to, 
# in that case we will switch instead of just playing with the viewport on top
var scene_paths =[
	"scene1.tscn",
	"scene2.tscn",
	"scene3.tscn",
	"scene4.tscn",
	"scene5.tscn",
	"scene6.tscn",
	"scene7.tscn"
]
var scene
var scene_index=0
# Called when the node enters the scene tree for the first time.
func _ready():
	# load the first scene, add it as a child
	load_scene()
	print(scene.anim)
	scene.anim.play("audio")
	pass # Replace with function body.
func load_scene():
	var scene_res = ResourceLoader.load(scene_paths[scene_index])
	scene = scene_res.instance()
	add_child(scene)
	scene.connect("finished",self,"start_transition")
func start_transition():
	scene_index+=1
	print("starting fade")
	SceneTransition.fade_out()
	# by yielding like this we can specify that we want to wait until the triggered fade out is done to finish our function
	yield(SceneTransition,"finished")
	# need to yield some how on the transition finished
	# how do I wait until this part is done?
	# can I put a call back in?
	print("faded all the way out")
	# this is also where we could show a loading page!!
	
	# now we switch the scene and fade back in, don't forget to connect up the finished signal to the function we are in
	scene.queue_free()
	load_scene()
	
	# make sure not to start playing the scene too early while the fade is out
	SceneTransition.fade_in()
	yield(SceneTransition,"finished")
	# now the fade out is gone, we can do our scene playing
	print(scene.anim)
	scene.anim.play("audio")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
