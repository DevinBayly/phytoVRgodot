extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	dir.open("./screenshots")
	dir.list_dir_begin()
	var f = dir.get_next()
	while f!= "":
#		print("f is ",f)
		if dir.current_is_dir() or "import" in f:
#			print("f is a dir",f)
			pass
		else:
#			print("adding")
			var texture_rect = TextureRect.new()
			var im = Image.new()
			im.load("./screenshots/"+f)
			texture_rect.texture = im
			add_child(texture_rect)
			texture_rect.set_owner(self)
		f =dir.get_next()
	print("number of children is",get_child_count())
	var p = PackedScene.new()
	p.pack(get_tree().get_current_scene())
	ResourceSaver.save("images_all.tscn",p)
	print(p._bundled)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
