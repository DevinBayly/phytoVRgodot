extends Node

var stream:StreamPeerTCP
const HOST = "127.0.0.1"
const PORT = 58886
const RECONNECT_TIMEOUT: float = 3.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var collection = PoolByteArray()
var im
var texture


# Called when the node enters the scene tree for the first time.
func _ready():
	stream = StreamPeerTCP.new()
	connect_to_host(HOST,PORT)
	pass # Replace with function body.

func connect_to_host(host,port):
	print("connecting",host," ",port)
	if stream.connect_to_host(host,port) != OK:
		print("error connecting to host")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func getim():
	print("getting image")
	print("stream")
	stream.put_string("ready for more")
	var bytes_to_read = stream.get_available_bytes()
	print("bytes to read were",bytes_to_read)
	var reading = false
	var data =PoolByteArray()
	while bytes_to_read >0:
		print("receiving ",bytes_to_read,"bytes of data")
		var response = stream.get_data(bytes_to_read)

		data.append_array(response[1])
		bytes_to_read = stream.get_available_bytes()
		reading = true
	if reading:
		im = Image.new()
		var error = im.load_png_from_buffer(data)
		print(error)
		texture = ImageTexture.new()
		texture.create_from_image(im)
		var ti = TextureRect.new()
		ti.texture= texture
		$"../VFlowContainer".add_child(ti)
	
		
	#stream.disconnect_from_host()
	
	pass


func _on_getimage_pressed():
	print("impress")
	#connect_to_host(HOST,PORT)
	getim()
	pass # Replace with function body.
