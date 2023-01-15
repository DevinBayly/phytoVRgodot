extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var reader = File.new()
	reader.open("./plants/plant_namings.json",File.READ)

	var contents = reader.get_as_text()
	var json_res = JSON.parse(contents)

	for e in json_res.result:
		print(e.coords)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
