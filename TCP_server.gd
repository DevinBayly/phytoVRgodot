extends Node

var tcp := TCP_Server.new()
var peers = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rep = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var res = tcp.listen(58887)
	print("strted listening",res)
	pass # Replace with function body.

var im_data = PoolByteArray()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rep += 1
	if rep%100 ==0:
		print(tcp.is_listening())
	if tcp.is_connection_available():
		print("connection available")
		var peer = tcp.take_connection()
		peers.append(peer)
	for i in range(0,peers.size()):
		var peer = peers[i]
		if peer.is_connected_to_host():
			var avail = peer.get_available_bytes()
			print("said this many bytes avail",avail)
			if avail > 0 :
				var data = peer.get_data(avail)
				# handle error codes from data[0] if needed
				im_data.append_array(data[1])
			else:
				print(typeof(im_data))
				print(im_data.size())
				var im = Image.new()
				im.load_png_from_buffer(im_data)
				im.save_png("tcp.png")
				peer.put_string("done")
		else :
			peers.pop_at(i)
	pass
