#macro NETWORKING false
#macro SERVER_IP "127.0.0.1"
#macro SERVER_PORT 38856
#macro Client global.client
function connection(ip = SERVER_IP, port = SERVER_PORT) constructor {
	socket = network_create_socket(network_socket_tcp);
	connected = network_connect_raw(socket, ip, port);
	
	enum AirNetwork {
		Null,
		Weapon
	}
	
	static send_weapon = function(inst, vars) {
		if (is_undefined(inst[$ "uid"])) {
			inst[$ "uid"] = uuid_v5_generate();
		}
		var buffer = buffer_create(0, buffer_grow, 2);
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, AirNetwork.Weapon);
		buffer_write(buffer, buffer_text, base64_encode(json_stringify(vars)));
		network_send_packet(socket, buffer, buffer_get_size(buffer));
		buffer_delete(buffer);
	}
	
	static process_packet = function(buffer) {
		var const = buffer_read(buffer, buffer_u8);
	}
}
if (NETWORKING) {
	Client = new connection(SERVER_IP, SERVER_PORT);
}
