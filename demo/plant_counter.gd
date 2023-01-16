extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var base

# Called when the node enters the scene tree for the first time.
func _ready():
	base = get_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_scripted_loading_plantcount(number):
	text = base+ ": "+ number
	pass # Replace with function body.
