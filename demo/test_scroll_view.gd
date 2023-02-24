extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var pos = 0

func _on_Button_pressed():
	pos +=10
	var manual_input = InputEventMouseMotion.new()
	manual_input.position = Vector2(0,pos)
	$scrollview/Viewport.input(manual_input)
	pass # Replace with function body.


func _on_Button2_pressed():
	pos -=10
	var manual_input = InputEventMouseMotion.new()
	manual_input.position = Vector2(0,pos)
	$scrollview/Viewport.input(manual_input)
	pass # Replace with function body.
