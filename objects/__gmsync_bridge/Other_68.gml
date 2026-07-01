// __gmsync_bridge — Async Networking Event (Other 68)
// ⚠️ Это Other_68, НЕ Other_75! В GMS2 2024.x:
//    Other_68 = Async Networking
//    Other_75 = Async Audio

// ДИАГНОСТИКА: дампим все ключи async_load при первых 5 вызовах
if (__gsb_diag_count < 5) {
    __gsb_diag_count++;
    var _dump = "[GMSync] Async68 #" + string(__gsb_diag_count) + " async_load keys: ";
    var _dk = ds_map_find_first(async_load);
    while (_dk != undefined) {
        _dump += string(_dk) + "=" + string(async_load[? _dk]) + " | ";
        _dk = ds_map_find_next(async_load, _dk);
    }
    show_debug_message(_dump);
}

// GMS2 может использовать "id" или "socket" в зависимости от типа соединения
var _type = async_load[? "type"];
var _sock = async_load[? "id"];
if (is_undefined(_sock) || _sock < 0) {
    _sock = async_load[? "socket"];
}

show_debug_message("[GMSync] Async68: type=" + string(_type) + " sock=" + string(_sock) + " our_sock=" + string(__gsb_sock));

// Если тип undefined — это не сетевое событие, игнорируем
if (is_undefined(_type)) {
    show_debug_message("[GMSync] Async68: type is undefined, not a network event — skip");
    exit;
}

if (_sock != __gsb_sock) {
    show_debug_message("[GMSync] Async68: sock mismatch (" + string(_sock) + " != " + string(__gsb_sock) + ") — skip");
    exit;
}

// Данные от VS Code — разбираем CMD-строки
if (_type == network_type_data) {
    var _raw = buffer_read(async_load[? "buffer"], buffer_text);
    show_debug_message("[GMSync] Async68: network_type_data received, size=" + string(async_load[? "size"]) + " raw='" + _raw + "'");
    __gsb_recv_buf += _raw;

    // Защита от переполнения recv-буфера
    if (string_length(__gsb_recv_buf) > 65536) {
        show_debug_message("[GMSync] Async68: recv_buf OVERFLOW — сброс");
        __gsb_recv_buf = "";
        exit;
    }

    var _nl = string_pos("\n", __gsb_recv_buf);
    show_debug_message("[GMSync] Async68: recv_buf='" + __gsb_recv_buf + "' nl_pos=" + string(_nl));
    while (_nl > 0) {
        var _line       = string_copy(__gsb_recv_buf, 1, _nl - 1);
        __gsb_recv_buf  = string_delete(__gsb_recv_buf, 1, _nl);
        _nl             = string_pos("\n", __gsb_recv_buf);

        show_debug_message("[GMSync] Async68: processing line='" + _line + "'");

        if (!string_starts_with(_line, "CMD:")) {
            show_debug_message("[GMSync] Async68: not a CMD line, skip");
            continue;
        }

        var _rest = string_delete(_line, 1, 4);
        var _sep  = string_pos("|", _rest);
        if (_sep <= 0) {
            show_debug_message("[GMSync] Async68: malformed CMD (no pipe), skip");
            continue;
        }

        var _id     = string_copy(_rest, 1, _sep - 1);
        var _cmd    = string_delete(_rest, 1, _sep);
        show_debug_message("[GMSync] Async68: executing CMD id='" + _id + "' cmd='" + _cmd + "'");
        var _result = __gmsync_exec(_id, _cmd);
        show_debug_message("[GMSync] Async68: CMD result='" + string(_result) + "'");

        var _rsp = "RSP:" + _id + "|" + string(_result) + "\n";
        var _buf = buffer_create(string_byte_length(_rsp), buffer_fixed, 1);
        buffer_write(_buf, buffer_text, _rsp);
        network_send_raw(__gsb_sock, _buf, buffer_tell(_buf));
        buffer_delete(_buf);
        show_debug_message("[GMSync] Async68: sent RSP='" + _rsp + "'");
    }
    exit;
}

// VS Code сервер закрылся или упал — переподключаемся автоматически
if (_type == network_type_disconnect) {
    __gsb_active   = false;
    __gsb_sock     = -1;
    __gsb_recv_buf = "";
    show_debug_message("[GMSync] Async68: network_type_disconnect — VS Code disconnected. Reconnecting in 3s...");
    alarm[0] = room_speed * 3;
    exit;
}

if (_type == network_type_connect) {
    show_debug_message("[GMSync] Async68: network_type_connect confirmed for sock=" + string(_sock));
    exit;
}

show_debug_message("[GMSync] Async68: unhandled type=" + string(_type));
