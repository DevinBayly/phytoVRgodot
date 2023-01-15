# client.gd
extends Node

var udp := PacketPeerUDP.new()
var connected = false

func _ready():
	udp.connect_to_host("127.0.0.1", 4242)
var first = false
func _process(delta):
	
	if udp.get_available_packet_count() > 0:

		print("message back")
		var pkts = udp.get_available_packet_count()
		print("num packets",pkts)
		if pkts > 1:
			var bytes = PoolByteArray()
			var count = 0
			for i in range(pkts):
				var pkt = udp.get_packet()
				count+=len(pkt)
				bytes.append_array(pkt)

			print(count)
			var im = Image.new()
			im.load_png_from_buffer(bytes)
			im.save_png("recovered_parts.png")
		



func _on_Button_button_down():
	udp.put_packet("The answer is... 42!".to_utf8())
	pass # Replace with function body.
