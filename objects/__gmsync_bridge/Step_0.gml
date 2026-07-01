// __gmsync_bridge — Step Event
// Периодический heartbeat-лог + отправка накопленных логов в VS Code
__gsb_heartbeat++;
if (__gsb_heartbeat >= 180) { // каждые ~3 секунды при 60fps
    __gsb_heartbeat = 0;
    show_debug_message("[GMSync] Step: active=" + string(__gsb_active) + " sock=" + string(__gsb_sock) + " recv_buf_len=" + string(string_length(__gsb_recv_buf)));
}

if (!__gsb_active) exit;
if (!ds_exists(__gsb_log_queue, ds_type_queue)) exit;

var _sent = 0;
while (!ds_queue_empty(__gsb_log_queue) && _sent < 100) {
    var _msg  = ds_queue_dequeue(__gsb_log_queue);
    var _ts   = string(current_hour) + ":"
              + string_format(current_minute, 2, 0) + ":"
              + string_format(current_second, 2, 0);
    var _line = "LOG:" + _ts + "|" + string(_msg) + "\n";
    var _buf  = buffer_create(string_byte_length(_line), buffer_fixed, 1);
    buffer_write(_buf, buffer_text, _line);
    network_send_raw(__gsb_sock, _buf, buffer_tell(_buf));
    buffer_delete(_buf);
    _sent++;
}
if (_sent > 0) {
    show_debug_message("[GMSync] Step: sent " + string(_sent) + " log(s) to VS Code");
}
