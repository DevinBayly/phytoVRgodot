# server.gd
extends Node

var server := UDPServer.new()
var peers = []

func _ready():
	server.listen(4242)

var step = 0
func _process(delta):
	server.poll() # Important!
	if server.is_connection_available():
		var peer : PacketPeerUDP = server.take_connection()
		var pkt = peer.get_packet()
		print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])
		print("Received data: %s" % [pkt.get_string_from_utf8()])
		# Reply so it knows we received the message.
#		peer.put_packet(pkt)
		# Keep a reference so we can keep contacting the remote peer.
		peers.append(peer)
	step +=1
	if step %100==0:
		step =0
		for i in range(0, peers.size()):
			var peer = peers[i]
			if peer.get_available_packet_count()>0:
				print("peer alive")
				
				var pkt = peer.get_packet()
				
				
				# Reply so it knows we received the message.
				var im_data = get_viewport().get_texture().get_data().save_png_to_buffer()


				print("dimension",get_viewport().size)

				print(len(im_data))
#				peer.put_packet(im_data)
				var cursor = 0
				var step = 2000
				var ii =0 
				while cursor < len(im_data):
					if cursor + step > len(im_data):
						peer.put_packet(im_data.subarray(cursor,-1))
					else:
						peer.put_packet(im_data.subarray(cursor,cursor+step))
					ii+=1
					cursor+=step
				print(ii,"packets")
				print("done")
			pass # Do something with the connected peers.
