// __gmsync_bridge — Alarm 0: попытка подключения к VS Code
if (__gsb_active) {
    show_debug_message("[GMSync] Alarm0: already connected, skip.");
    exit;
}

// Уничтожаем старый сокет если был
if (__gsb_sock >= 0) {
    show_debug_message("[GMSync] Alarm0: destroying old socket " + string(__gsb_sock));
    network_destroy(__gsb_sock);
    __gsb_sock = -1;
}

show_debug_message("[GMSync] Alarm0: creating socket and connecting to 127.0.0.1:6503...");
var _s = network_create_socket(network_socket_tcp);
show_debug_message("[GMSync] Alarm0: socket created = " + string(_s));

var _r = network_connect_raw(_s, "127.0.0.1", 6503);
show_debug_message("[GMSync] Alarm0: network_connect_raw result = " + string(_r));

if (_r >= 0) {
    __gsb_sock     = _s;
    __gsb_active   = true;
    __gsb_recv_buf = "";
    show_debug_message("[GMSync] Alarm0: CONNECTED to VS Code! sock=" + string(__gsb_sock));
} else {
    network_destroy(_s);
    show_debug_message("[GMSync] Alarm0: VS Code not running (result=" + string(_r) + "), retry in 3s...");
    alarm[0] = room_speed * 3;
}
