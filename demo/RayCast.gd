extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal collided(collider)
signal exited(collider)
var last_collided:Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if not is_colliding():
		if last_collided != null:
			emit_signal("exited",last_collided)
		last_collided= null
		return
	var collision = get_collider()
	if collision != last_collided:
		if last_collided != null:
			emit_signal("exited",last_collided)
		last_collided = collision
		emit_signal("collided",last_collided)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
