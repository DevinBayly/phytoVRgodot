extends Node3D

@onready var player = $player_vr
@onready var glyph = $"intersection glyph"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.collided():
		var loc = player.get_collision()
		print(loc)
		glyph.global_transform.origin = loc
	pass


