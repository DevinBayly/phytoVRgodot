extends Node

var server := UDPServer.new()
var peers = []
var im_data = PoolByteArray()
var num = 0
func _ready():
	server.listen(58886)

func _process(delta):
	server.poll() # Important!
	if server.is_connection_available():
		var peer : PacketPeerUDP = server.take_connection()
#		var pkt = peer.get_packet()
#		print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
#		print("Received data: %s" % [pkt.get_string_from_utf8()])
		# Reply so it knows we received the message.
#		peer.put_packet(pkt)
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)

	for i in range(0, peers.size()):
		var peer = peers[i]
		var count = peer.get_available_packet_count()
		var total = 0
		if count > 0:
			print("num message is ",num)
			num+=1
			print("packet count",count)
			var pkt = peer.get_packet()
			if pkt.size()== 0:
				# they are sending null char and ending message
				var im = Image.new()
				print("data length",im_data.size())
				im.load_png_from_buffer(im_data)
				im.save_png("demo.png")
			im_data.append_array(pkt)
			print("pkt size was ",pkt.size())
			peer.put_packet("continue".to_utf8())
			#print("msg", pkt.get_string_from_utf8())
			
	pass # Do something with the connected peers.
